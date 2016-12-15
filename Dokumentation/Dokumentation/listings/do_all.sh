#!/bin/bash
#
# set variables
DATE=`date +%Y%m%d_%H-%M`
BACKUP_FILENAME="/home/dschwenk/backup/"$DATE"_backup.tar.gz"

BACKUP_KIPPO_LOG="/home/kippo/kippo/log/kippo.log"
BACKUP_KIPPO_CONF="/home/kippo/kippo/kippo.cfg"
BACKUP_KIPPO_DATA="/home/dschwenk/kippo-data"
BACKUP_SNARE_LOG="/home/mstroh/snare/snare.log"

PIPAL_OUTPUT="/home/dschwenk/pipal/pipal-stats.txt"
BACKUP_SNARE_POST="/home/mstroh/logs/snare-post.txt"
BACKUP_SNARE_REQUEST_PATHS="/home/mstroh/logs/snare-request-paths.txt"

BACKUP_FIREWALL="/home/dschwenk/firewall/iptables-backup.txt"

# start Kippo logfile data extract
/home/dschwenk/kippo-data/extract-logifile-data.sh

# do reverse-DNS lookup
/home/dschwenk/kippo-data/do_reverse_dns_lookup.sh

# do Pipal password analysis
/home/dschwenk/pipal/pipal.rb --output $PIPAL_OUTPUT /home/dschwenk/kippo-data/pw.txt

# do firewall stuff
/home/dschwenk/firewall/create-iptable-rules.sh

# extract SNARE logfile data
/home/mstroh/extract_snare_logfile_entries.sh

# do backup stuff
# create zip
tar czPf $BACKUP_FILENAME $BACKUP_KIPPO_LOG $BACKUP_KIPPO_CONF $BACKUP_KIPPO_DATA $PIPAL_OUTPUT $BACKUP_FIREWALL $BACKUP_SNARE_LOG $BACKUP_SNARE_POST $BACKUP_SNARE_REQUEST_PATHS

# upload backup
gdrive upload $BACKUP_FILENAME
