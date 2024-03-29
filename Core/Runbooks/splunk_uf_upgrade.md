# Splunk UF - Upgrade

- Date: 2022.11.21
- Splunk UF: v9.0.2
- OS: RHEL 7 & 8, CentOS 7 & 8, Rocky 8, Ubuntu 16/18/20 LTS, AWS Linux 2

## Upgrade

```bash
# Download Splunk Core 9.0.2
wget -O splunkforwarder-9.0.2-17e00c557dc1-Linux-x86_64.tgz "https://download.splunk.com/products/universalforwarder/releases/9.0.2/linux/splunkforwarder-9.0.2-17e00c557dc1-Linux-x86_64.tgz"

# Download the MD5 hash
wget -O splunkforwarder-9.0.2-17e00c557dc1-Linux-x86_64.tgz.md5 'https://download.splunk.com/products/universalforwarder/releases/9.0.2/linux/splunkforwarder-9.0.2-17e00c557dc1-Linux-x86_64.tgz.md5'

# Check the MD5 hash 
md5sum -c splunkforwarder-9.0.2-17e00c557dc1-Linux-x86_64.tgz.md5

# Stop UF
sudo systemctl stop SplunkForwarder 

# Extract Splunk
sudo tar -zxvf splunkforwarder-9.0.2-17e00c557dc1-Linux-x86_64.tgz -C /opt/

# Change ownership of the extracted files 
sudo chown -R splunk: /opt/splunkforwarder/

# Accept the migration warnings (without checking!) and start Splunk
sudo /opt/splunkforwarder/bin/splunk start --accept-license --answer-yes

# Verify
tail -F /opt/splunkforwarder/var/log/splunk/splunkd.log
```
