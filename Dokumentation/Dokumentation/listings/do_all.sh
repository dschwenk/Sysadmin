#!/bin/bash
#
# set variables
DATE=`date +%Y%m%d_%H-%M`
BACUP_FILENAME="/home/dschwenk/backup/backup.tar.gz"
PIPAL_OUTPUT="/home/dschwenk/pipal/pipal-stats.txt"
BACKUP_KIPPO_LOG="/home/kippo/kippo/log/kippo.log"
BACKUP_FIREWALL="/home/dschwenk/firewall/iptables-backup.txt"
#BACUP_FILENAME="/home/dschwenk/backup/$DATE_backup.tar.gz"

# start Kippo logfile data extract
/home/dschwenk/kippo-data/extract-logifile-data.sh

# do Pipal password analysis
/home/dschwenk/pipal/pipal.rb --output $PIPAL_OUTPUT /home/dschwenk/kippo-data/pw.txt

# do firewall stuff
/home/dschwenk/firewall/create-iptable-rules.sh

# do backup stuff
# create zip
tar -czvf $BACUP_FILENAME $BACKUP_KIPPO_LOG $PIPAL_OUTPUT $BACKUP_FIREWALL

# upload backup
gdrive upload $BACUP_FILENAME

# cleanup

