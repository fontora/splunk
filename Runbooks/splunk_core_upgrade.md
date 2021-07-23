# Splunk Core - Upgrade

Tested for 8.2.1 on 2021.07.23.

```bash
# Download the Splunk Core 8.2.1
wget -O splunk-8.2.1-ddff1c41e5cf-Linux-x86_64.tgz 'https://www.splunk.com/bin/splunk/DownloadActivityServlet?architecture=x86_64&platform=linux&version=8.2.1&product=splunk&filename=splunk-8.2.1-ddff1c41e5cf-Linux-x86_64.tgz&wget=true'

# Download the MD5 hash
wget -O splunk-8.2.1-ddff1c41e5cf-Linux-x86_64.tgz.md5 'https://download.splunk.com/products/splunk/releases/8.2.1/linux/splunk-8.2.1-ddff1c41e5cf-Linux-x86_64.tgz.md5'

# Check the MD5 hash
md5sum -c splunk-8.2.1-ddff1c41e5cf-Linux-x86_64.tgz.md5

# Stop Splunk
sudo systemctl stop Splunkd

# Extract the update
sudo tar -zxvf splunk-8.2.1-ddff1c41e5cf-Linux-x86_64.tgz -C /opt/

# Change ownership of the extracted files
sudo chown -R splunk: /opt/splunk/

# Accept the migration warnings (without checking!)
sudo -iu splunk /opt/splunk/bin/splunk status --accept-license --answer-yes --no-prompt

# Start Splunk
sudo systemctl start Splunkd

# Verify
sudo tail -F /opt/splunk/var/log/splunk/splunkd.log
