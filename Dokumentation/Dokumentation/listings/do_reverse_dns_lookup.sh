#!/bin/bash
#
# set variables
IPFILE="/home/dschwenk/kippo-data/ips.txt"
OUTPUTFILE="/home/dschwenk/kippo-data/reverse-dns.txt"

# remove old reverse-dns file (if exists)
if [ -f $OUTPUTFILE ];
then
  rm $OUTPUTFILE
fi

# do reserse DNS lookup
while read IP; do # get each IP address from file
  # do lookup and append answer to output file
  getent hosts $IP >> $OUTPUTFILE
done < $IPFILE