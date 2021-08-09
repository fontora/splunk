# Splunk UF - Install

- Date: 2021.07.23
- Splunk UF: v8.2.1
- OS: RHEL 7 & 8, CentOS 7 & 8, Rocky 8, Ubuntu 16/18/20 LTS, AWS Linux 2

## Base install

```bash
# Download Splunk Core 8.2.1
wget -O splunkforwarder-8.2.1-ddff1c41e5cf-Linux-x86_64.tgz 'https://www.splunk.com/bin/splunk/DownloadActivityServlet?architecture=x86_64&platform=linux&version=8.2.1&product=universalforwarder&filename=splunkforwarder-8.2.1-ddff1c41e5cf-Linux-x86_64.tgz&wget=true'

# Download the MD5 hash
wget -O splunkforwarder-8.2.1-ddff1c41e5cf-Linux-x86_64.tgz.md5 'https://download.splunk.com/products/universalforwarder/releases/8.2.1/linux/splunkforwarder-8.2.1-ddff1c41e5cf-Linux-x86_64.tgz.md5'

# Check the MD5 hash 
md5sum -c splunkforwarder-8.2.1-ddff1c41e5cf-Linux-x86_64.tgz.md5

# Extract Splunk
sudo tar -zxvf splunkforwarder-8.2.1-ddff1c41e5cf-Linux-x86_64.tgz -C /opt/

# Add a splunk user
sudo useradd splunk

# Change ownership of the extracted files 
sudo chown -R splunk: /opt/splunkforwarder/

# Enable Splunk to start automatically using systemd - don't create a local admin user
sudo /opt/splunkforwarder/bin/splunk enable boot-start -user splunk --accept-license -systemd-managed 1 --no-prompt
```

## Verification

```bash
# Overly aggressive reboot will confirm everything works as expected
sudo reboot

# Monitor log
sudo tail -F /opt/splunk/var/log/splunk/splunkd.log
```
