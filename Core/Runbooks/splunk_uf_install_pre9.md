# Splunk UF - Install

- Date: 2021.10.04
- Splunk UF: v8.2.2.1
- OS: RHEL 7 & 8, CentOS 7 & 8, Rocky 8, Ubuntu 16/18/20 LTS, AWS Linux 2

## Base install

```bash
# Download Splunk Core 8.2.1
wget -O splunkforwarder-8.2.2.1-ae6821b7c64b-Linux-x86_64.tgz 'https://d7wz6hmoaavd0.cloudfront.net/products/universalforwarder/releases/8.2.2.1/linux/splunkforwarder-8.2.2.1-ae6821b7c64b-Linux-x86_64.tgz'

# Download the MD5 hash
wget -O splunkforwarder-8.2.2.1-ae6821b7c64b-Linux-x86_64.tgz.md5 'https://d7wz6hmoaavd0.cloudfront.net/products/universalforwarder/releases/8.2.2.1/linux/splunkforwarder-8.2.2.1-ae6821b7c64b-Linux-x86_64.tgz.md5'

# Check the MD5 hash 
md5sum -c splunkforwarder-8.2.2.1-ae6821b7c64b-Linux-x86_64.tgz.md5

# Extract Splunk
sudo tar -zxvf splunkforwarder-8.2.2.1-ae6821b7c64b-Linux-x86_64.tgz -C /opt/

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
