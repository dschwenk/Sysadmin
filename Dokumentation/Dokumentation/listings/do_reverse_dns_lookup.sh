#!/bin/bash
#
# set variables
IPFILE="/home/dschwenk/kippo-data/ips.txt"
OUTPUTFILE="/home/dschwenk/kippo-data/reverse-dns.txt"

# remove old reverse-dns file
if [ -f $OUTPUTFILE ];
then
	rm $OUTPUTFILE
fi

# do reserse DNS lookup
while read IP; do
	getent hosts $IP >> $OUTPUTFILE
done < $IPFILE