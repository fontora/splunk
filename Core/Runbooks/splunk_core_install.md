# Splunk Core - Install

- Date: 2024.04.13
- Splunk Core: v9.2.1
- OS: RHEL 8 & 9

## Base install

```bash
# Ensure wget is installed
sudo dnf install -y wget

# Download the Splunk Core 9.2.1
wget -O splunk-9.2.1-78803f08aabb-Linux-x86_64.tgz "https://download.splunk.com/products/splunk/releases/9.2.1/linux/splunk-9.2.1-78803f08aabb-Linux-x86_64.tgz"

# Download the MD5 hash
wget -O splunk-9.2.1-78803f08aabb-Linux-x86_64.tgz.md5 "https://download.splunk.com/products/splunk/releases/9.2.1/linux/splunk-9.2.1-78803f08aabb-Linux-x86_64.tgz.md5"

# Check the MD5 hash
md5sum -c splunk-9.2.1-78803f08aabb-Linux-x86_64.tgz.md5

# Extract Splunk
sudo tar -zxvf splunk-9.2.1-78803f08aabb-Linux-x86_64.tgz -C /opt/

# Add a splunk user
sudo useradd splunk

# Change ownership of the extracted files
sudo chown -R splunk: /opt/splunk/

# Set admin username and password
sudo install -o splunk -g splunk -m 644 /dev/null /opt/splunk/etc/system/local/user-seed.conf
sudo cat > /opt/splunk/etc/system/local/user-seed.conf << EOL
[user_info]
USERNAME = admin
PASSWORD = changeme2
EOL

# Enable Splunk to start automatically using systemd
sudo /opt/splunk/bin/splunk enable boot-start -user splunk --accept-license -systemd-managed 1

# Update ulimits in unit file
# Use systemd drop-in to set ulimits
sudo mkdir /etc/systemd/system/Splunkd.service.d
sudo tee /etc/systemd/system/Splunkd.service.d/splunk_ps.conf > /dev/null <<EOF
[Service]
LimitNPROC=20480
EOF
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
# https://www.kernel.org/doc/html/next/admin-guide/mm/transhuge.html
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

firewalld commands, only needed for RHEL / CentOS / Rocky.

```bash
# Open ports as required
sudo firewall-cmd --add-port={443/tcp,8000/tcp,8089/tcp}

# Redirect 443 to 8000 if desired
sudo firewall-cmd --add-forward-port=port=443:proto=tcp:toport=8000

# Save the changes
sudo firewall-cmd --runtime-to-permanent
sudo firewall-cmd --reload
```

## Verification

```bash
# Overly aggressive reboot will confirm everything works as expected
sudo reboot

# Check cgroups version (v1 or v2), v2 is not compatible with WLM
# RHEL 9 instructions to enable v1: https://access.redhat.com/solutions/6955882
mount -l | grep cgroup

# Verify ulimits, and then monitor
sudo grep ulimit /opt/splunk/var/log/splunk/splunkd.log
sudo tail -F /opt/splunk/var/log/splunk/splunkd.log
```
