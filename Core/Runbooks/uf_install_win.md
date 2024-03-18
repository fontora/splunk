# Splunk UF - Install

- Date: 2023.08.17
- Splunk UF: v9.1.0.1
- OS: Windows 2022

## Base install

```bash

# Download UF 9.1.0.1
Invoke-WebRequest -Uri https://download.splunk.com/products/universalforwarder/releases/9.1.0.1/windows/splunkforwarder-9.1.0.1-77f73c9edb85-x64-release.msi -OutFile splunkforwarder-9.1.0.1-77f73c9edb85-x64-release.msi 

# Download the MD5 hash
Invoke-WebRequest -Uri https://download.splunk.com/products/universalforwarder/releases/9.1.0.1/windows/splunkforwarder-9.1.0.1-77f73c9edb85-x64-release.msi.md5 -OutFile splunkforwarder-9.1.0.1-77f73c9edb85-x64-release.msi.md5

# Check the MD5 hash 
Get-FileHash -Algorithm MD5 .\splunkforwarder-9.1.0.1-77f73c9edb85-x64-release.msi
Get-Content .\splunkforwarder-9.1.0.1-77f73c9edb85-x64-release.msi.md5

# Install the UF
msiexec /i splunkforwarder-9.1.0.1-77f73c9edb85-x64-release.msi AGREETOLICENSE=Yes GENRANDOMPASSWORD=1 /quiet /l*v C:\Windows\Temp\Splunk_UF_Install.log
```

## Verification

```bash
# Overly aggressive reboot will confirm everything works as expected
sudo reboot

# Monitor log
sudo tail -F /opt/splunkforwarder/var/log/splunk/splunkd.log
```
