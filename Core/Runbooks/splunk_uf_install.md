# Splunk UF - Install

- Date: 2023.07.27
- Splunk UF: v9.1.0.1
- OS: RHEL 8, Ubuntu 22.04

https://docs.splunk.com/Documentation/Splunk/latest/Installation/StartSplunkforthefirsttime
https://docs.splunk.com/Documentation/Splunk/latest/Security/Secureyouradminaccount
https://docs.splunk.com/Documentation/Forwarder/9.0.0/Forwarder/Installanixuniversalforwarder

## Base install

```bash
# Ensure wget is installed
sudo dnf install -y wget

# Download UF 9.1.0.1
wget -O splunkforwarder-9.1.0.1-77f73c9edb85-Linux-x86_64.tgz "https://download.splunk.com/products/universalforwarder/releases/9.1.0.1/linux/splunkforwarder-9.1.0.1-77f73c9edb85-Linux-x86_64.tgz"

# Download the MD5 hash
wget -O splunkforwarder-9.1.0.1-77f73c9edb85-Linux-x86_64.tgz.md5 "https://download.splunk.com/products/universalforwarder/releases/9.1.0.1/linux/splunkforwarder-9.1.0.1-77f73c9edb85-Linux-x86_64.tgz.md5"

# Check the MD5 hash 
md5sum -c splunkforwarder-9.1.0.1-77f73c9edb85-Linux-x86_64.tgz.md5

# Extract Splunk
sudo tar -zxvf splunkforwarder-9.1.0.1-77f73c9edb85-Linux-x86_64.tgz -C /opt/

# Add a splunk user
sudo useradd -m splunk

# Change ownership of the extracted files 
sudo chown -R splunk: /opt/splunkforwarder/

# Enable Splunk to start automatically using systemd - don't create a local admin user
# Generate random password, 
sudo /opt/splunkforwarder/bin/splunk start --accept-license --gen-and-print-passwd

# Generate no admin username
sudo /opt/splunkforwarder/bin/splunk start --accept-license --no-prompt
```

## Verification

```bash
# Overly aggressive reboot will confirm everything works as expected
sudo reboot

# Monitor log
sudo tail -F /opt/splunkforwarder/var/log/splunk/splunkd.log
```
