# Splunk Core - Upgrade

- Date: 2023.12.06
- Splunk Core: v9.1.2
- OS: RHEL 8 & 9

```bash

# Download the Splunk Core 9.1.2
wget -O splunk-9.1.2-b6b9c8185839-Linux-x86_64.tgz "https://download.splunk.com/products/splunk/releases/9.1.2/linux/splunk-9.1.2-b6b9c8185839-Linux-x86_64.tgz"

# Download the MD5 hash
wget -O splunk-9.1.2-b6b9c8185839-Linux-x86_64.tgz.md5 https://download.splunk.com/products/splunk/releases/9.1.2/linux/splunk-9.1.2-b6b9c8185839-Linux-x86_64.tgz.md5

# Check the MD5 hash
md5sum -c splunk-9.1.2-b6b9c8185839-Linux-x86_64.tgz.md5

# Stop Splunk
sudo systemctl stop Splunkd

# Extract Splunk
sudo tar -zxvf splunk-9.1.2-b6b9c8185839-Linux-x86_64.tgz -C /opt/

# Change ownership of the extracted files
sudo chown -R splunk: /opt/splunk/

# Accept the migration warnings (without checking!) and start Splunk
/opt/splunk/bin/splunk status --accept-license --answer-yes --no-prompt

# Start Splunk
sudo systemctl start Splunkd

# Verify
sudo tail -F /opt/splunk/var/log/splunk/splunkd.log
