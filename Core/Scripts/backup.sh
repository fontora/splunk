#!/bin/bash

# Author:  Matt Searles
# Date:    20211.02.24
# Version: 0.1

###############
## VARIABLES ##
###############

backup_dir="/tmp"
hostname=$(hostname)
timestamp=$(date "+%Y%m%d_%H%M%S")
splunk_etc="/opt/splunk/etc/"
splunk_exclude="/opt/splunk/etc/apps/splunk_archiver"
tar_bin="/bin/tar"
tar_opts="-zxvf"
sudo_bin="/usr/bin/sudo"

##########
## MAIN ##
##########

${sudo_bin} ${tar_bin} --exclude ${splunk_exclude} ${tar_opts} ${backup_dir}/${hostname}_${timestamp}.tgz ${splunk_etc}
