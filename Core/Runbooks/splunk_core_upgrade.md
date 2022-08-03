# Splunk Core - Upgrade

- Date: 2022.01.20
- Splunk Core: v8.2.4
- OS: RHEL 7 & 8, CentOS 7 & 8, Rocky 8, Ubuntu 16/18/20 LTS, AWS Linux 2

```bash
# Download the Splunk Core 8.2.1
wget -O splunk-8.2.4-87e2dda940d1-Linux-x86_64.tgz 'https://download.splunk.com/products/splunk/releases/8.2.4/linux/splunk-8.2.4-87e2dda940d1-Linux-x86_64.tgz'

# Download the MD5 hash
wget -O splunk-8.2.4-87e2dda940d1-Linux-x86_64.tgz.md5 'https://download.splunk.com/products/splunk/releases/8.2.4/linux/splunk-8.2.4-87e2dda940d1-Linux-x86_64.tgz.md5'

# Check the MD5 hash
md5sum -c splunk-8.2.4-87e2dda940d1-Linux-x86_64.tgz.md5

# Stop Splunk
sudo systemctl stop Splunkd

# Extract the update
sudo tar -zxvf splunk-8.2.4-87e2dda940d1-Linux-x86_64.tgz -C /opt/

# Change ownership of the extracted files
sudo chown -R splunk: /opt/splunk/

# Accept the migration warnings (without checking!) and start Splunk
/opt/splunk/bin/splunk start --accept-license --answer-yes --no-prompt

# Verify
sudo tail -F /opt/splunk/var/log/splunk/splunkd.log