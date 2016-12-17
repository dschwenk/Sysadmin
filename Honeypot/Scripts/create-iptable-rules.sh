#!/bin/bash
#
# set variables
FW="/sbin/iptables"
IPFILE="/home/dschwenk/kippo-data/ips.txt"
BACKUPFILE="/home/dschwenk/firewall/iptables-backup.txt"

# backup current rules
iptables-save > $BACKUPFILE

# delete existing rules and chains
$FW -F
$FW -X

# set standard rules
$FW -P INPUT   ACCEPT
$FW -P FORWARD ACCEPT
$FW -P OUTPUT  ACCEPT

while read IP; do
  $FW -A INPUT -s $IP -j DROP
done < $IPFILE

