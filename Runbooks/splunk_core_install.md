# Splunk Core - Install

- Date: 2021.07.23
- Splunk Core: v8.2.1
- OS: RHEL 7 & 8, CentOS 7 & 8, Rocky 8, Ubuntu 16/18/20 LTS, AWS Linux 2

## Base install

```bash
# Download the Splunk Core 8.2.1
wget -O splunk-8.2.1-ddff1c41e5cf-Linux-x86_64.tgz 'https://www.splunk.com/bin/splunk/DownloadActivityServlet?architecture=x86_64&platform=linux&version=8.2.1&product=splunk&filename=splunk-8.2.1-ddff1c41e5cf-Linux-x86_64.tgz&wget=true'

# Download the MD5 hash
wget -O splunk-8.2.1-ddff1c41e5cf-Linux-x86_64.tgz.md5 'https://download.splunk.com/products/splunk/releases/8.2.1/linux/splunk-8.2.1-ddff1c41e5cf-Linux-x86_64.tgz.md5'

# Check the MD5 hash
md5sum -c splunk-8.2.1-ddff1c41e5cf-Linux-x86_64.tgz.md5

# Extract Splunk
sudo tar -zxvf splunk-8.2.1-ddff1c41e5cf-Linux-x86_64.tgz -C /opt/

# Add a splunk user
sudo useradd splunk

# Change ownership of the extracted files
sudo chown -R splunk: /opt/splunk/

# Set admin username and password
sudo install -o splunk -g splunk -m 644 /dev/null /opt/splunk/etc/system/local/user-seed.conf
sudo cat > /opt/splunk/etc/system/local/user-seed.conf << EOL
[user_info]
USERNAME = admin
PASSWORD = <ENTER_PASSWORD_HERE>
EOL

# Enable Splunk to start automatically using systemd
sudo /opt/splunk/bin/splunk enable boot-start -user splunk --accept-license -systemd-managed 1

# Update ulimits in unit file
sudo sed -i 's/^LimitNOFILE=65536/LimitCORE=0\nLimitFSIZE=infinity\nLimitNOFILE=65536\nLimitNPROC=20480\nLimitDATA=infinity/' /etc/systemd/system/Splunkd.service

# Add an alias of 'splunk.service', no one likes capitals in Linux
sudo sed -i '/^\[Install\]/a Alias=splunk.service' /etc/systemd/system/Splunkd.service
```

## systemd Checks

```bash
# Verify at least version 219 of systemd is installed
systemctl --version | head -n 1

# Verify systemd is running as the init process (PID 1)
pidof systemd
```

## OS Tuning

```bash
# Create a systemd unit file to disable THP
sudo cat > /etc/systemd/system/disable-thp.service << EOL
[Unit]
Description=Disable Transparent Huge Pages (THP)

[Service]
Type=simple
ExecStart=/bin/sh -c "echo 'never' > /sys/kernel/mm/transparent_hugepage/enabled && echo 'never' > /sys/kernel/mm/transparent_hugepage/defrag"

[Install]
WantedBy=multi-user.target
EOL

# Enable and start the newly created unit file
sudo systemctl daemon-reload
sudo systemctl enable --now disable-thp
```

## Host Firewall

firewalld commands, TODO ufw:

```bash
# Open ports as required
sudo firewall-cmd --add-port={443/tcp,8000/tcp,8089/tcp}

# Redirect 443 to 8000 for "prettiness"
sudo firewall-cmd --add-forward-port=port=443:proto=tcp:toport=8000

# Save the changes
sudo firewall-cmd --runtime-to-permanent
sudo firewall-cmd --reload
```

## Verification

```bash
# Overly aggressive reboot will confirm everything works as expected
sudo reboot

# Verify ulimits, and then monitor
sudo grep ulimit /opt/splunk/var/log/splunk/splunkd.log
sudo tail -F /opt/splunk/var/log/splunk/splunkd.log
```
