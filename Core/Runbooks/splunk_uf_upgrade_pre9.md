# Splunk UF - Upgrade

- Date: 2021.07.23
- Splunk UF: v8.2.1
- OS: RHEL 7 & 8, CentOS 7 & 8, Rocky 8, Ubuntu 16/18/20 LTS, AWS Linux 2

## Upgrade

```bash
# Download Splunk UF 8.2.1
wget -O splunkforwarder-8.2.1-ddff1c41e5cf-Linux-x86_64.tgz 'https://www.splunk.com/bin/splunk/DownloadActivityServlet?architecture=x86_64&platform=linux&version=8.2.1&product=universalforwarder&filename=splunkforwarder-8.2.1-ddff1c41e5cf-Linux-x86_64.tgz&wget=true'

# Download the MD5 hash
wget -O splunkforwarder-8.2.1-ddff1c41e5cf-Linux-x86_64.tgz.md5 'https://download.splunk.com/products/universalforwarder/releases/8.2.1/linux/splunkforwarder-8.2.1-ddff1c41e5cf-Linux-x86_64.tgz.md5'

# Check the MD5 hash 
md5sum -c splunkforwarder-8.2.1-ddff1c41e5cf-Linux-x86_64.tgz.md5

# Stop UF
sudo systemctl stop SplunkForwarder 

# Extract
sudo tar -zxvf splunkforwarder-8.2.1-ddff1c41e5cf-Linux-x86_64.tgz -C /opt/

# Change ownership of the extracted files 
sudo chown -R splunk: /opt/splunkforwarder/

# Accept the migration warnings (without checking!) and start Splunk
sudo /opt/splunkforwarder/bin/splunk start --accept-license --answer-yes --no-prompt

# Verify
tail -F /opt/splunkforwarder/var/log/splunk/splunkd.log
```
