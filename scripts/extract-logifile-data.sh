#!/bin/bash
#
# set variables
KIPPO_LOG="/home/kippo/kippo/log/kippo.log"
USERNAME_FILE="/home/dschwenk/kippo-data/usernames.txt"
PW_FILE="/home/dschwenk/kippo-data/pw.txt"
IP_FILE="/home/dschwenk/kippo-data/ips.txt"

# extract usernames
grep ' login attempt ' $KIPPO_LOG |
  awk '{print ($9)}' |
  sort |
  uniq |
  sed -r 's/]|\[//g' > $USERNAME_FILE

# extract passwords
grep ' login attempt ' $KIPPO_LOG |
  awk '{print ($9)}' |
  sed "s|^.*/||g" |
  sed "s|]||g" > $PW_FILE

# extract IPs
cat $KIPPO_LOG | 
  grep -o '[0-9]\{1,3\}\.[0-9]\{1,3\}\.[0-9]\{1,3\}\.[0-9]\{1,3\}' |
  sort |
  uniq > $IP_FILE
