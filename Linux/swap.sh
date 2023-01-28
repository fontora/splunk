#!/bin/bash 

# Variables
SUM="0"
OVERALL="0"
ARRAY=()
LIMIT="15"

if [[ ! -z $1 ]]; then
  LIMIT=$1
fi

# Traverse /proc
for DIR in `find /proc/ -maxdepth 1 -type d | egrep "^/proc/[0-9]"`; do
  PID=`echo $DIR | cut -d / -f 3`
  PROGNAME=`ps -p $PID -o comm --no-headers`

  # Total swap usage
  for SWAP in `grep Swap $DIR/smaps 2>/dev/null | awk '{print $2}'`; do
    let SUM=$SUM+$SWAP
  done

  # Format output
  value=$(printf "%5s %6s %15s %8s %-15s\n" "PID: " "$PID" "Swap used: " "$SUM K" "     $PROGNAME")
  ARRAY+=("$value\n")

  let OVERALL=$OVERALL+$SUM
  SUM="0"
done

MB=$(($OVERALL / 1024))

# Sort based on swap
echo -e "${ARRAY[@]}" | sort -n -k5 | tail -n $LIMIT
echo
echo "Overall swap used: $OVERALL K ($MB MB)"
