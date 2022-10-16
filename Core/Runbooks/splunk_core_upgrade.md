# Splunk Core - Upgrade

- Date: 2022.09.20
- Splunk Core: v9.0.1
- OS: RHEL 7 & 8, CentOS 7 & 8, Rocky 8, Ubuntu 18/20/22 LTS, AWS Linux 2

```bash
# Download the Splunk Core 9.0.1
wget -O splunk-9.0.1-82c987350fde-Linux-x86_64.tgz "https://download.splunk.com/products/splunk/releases/9.0.1/linux/splunk-9.0.1-82c987350fde-Linux-x86_64.tgz"

# Download the MD5 hash
wget -O splunk-9.0.1-82c987350fde-Linux-x86_64.tgz.md5 'https://download.splunk.com/products/splunk/releases/9.0.1/linux/splunk-9.0.1-82c987350fde-Linux-x86_64.tgz.md5'

# Check the MD5 hash
md5sum -c splunk-9.0.1-82c987350fde-Linux-x86_64.tgz.md5

# Stop Splunk
sudo systemctl stop Splunkd

# Extract the update
sudo tar -zxvf splunk-9.0.1-82c987350fde-Linux-x86_64.tgz -C /opt/

# Change ownership of the extracted files
sudo chown -R splunk: /opt/splunk/

# Accept the migration warnings (without checking!) and start Splunk
/opt/splunk/bin/splunk status --accept-license --answer-yes --no-prompt

# Start Splunk
sudo systemctl start Splunkd

# Verify
sudo tail -F /opt/splunk/var/log/splunk/splunkd.log
