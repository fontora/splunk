#!/bin/bash

###############
## VARIABLES ##
###############

# Exclude "boring" directories commonly found in RHEL / Ubuntu
results=( $(du -a --exclude={dev,lost+found,media,mnt,proc,run,srv,sys} --time --time-style='+%s' / | tr -s '[:blank:]' '|') )
date=$(date '+%s')
output="/tmp/du_output.psv"

##########
## MAIN ##
##########

# Remove file if it exists
if [[ -f ${output} ]]; then
 rm ${output}
fi

# Header
echo "#time_collected|size|time_modified|path" >> ${output}

# Prepend the date to each entry in the array
for result in "${results[@]}"
do
  echo "${date}|${result}" >> ${output}
done
