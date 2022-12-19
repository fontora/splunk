#!/bin/bash

# Variables
date_max_ago=-365
earliest_time=-2
latest_time=-1
user="admin"
pass="password"
url=" https://myhost:8089/services/search/jobs/export"
search="search index=firewall host=blah| table _raw"
output_mode="csv"
file="sp-app01.csv"
file_count="1"

# Loop until max date is hit
while [[ ${date_earliest} -ge ${date_max_ago} ]]; do
  command="curl -k -u ${user}:${pass} ${url} --data-urlencode search='${search}' -d output_mode=${output_mode} -d earliest_time='${earliest_time}d@d' -d latest_time='${latest_time}d@d' -o ${file}.${file_count}"
  echo "command=${command}"
  date_earliest=$(( ${date_earliest}-1 ))
  date_latest=$(( ${date_latest}-1))
  file_count=$(( ${file_count}+1 ))
done

# Concatenate all CSV's
cat ${file}.* > final.csv
