SNARE_LOG="/home/mstroh/snare/snare.log"
SNARE_POST="/home/mstroh/logs/snare-post.txt"
SNARE_REQUEST_PATHS="/home/mstroh/logs/snare-request-paths.txt"

# extract POST-requests
grep 'POST data:' $SNARE_LOG | 
tr -s '\n' |
sort |
uniq -ic |
sort -bgr > $SNARE_POST

# extract request-paths
grep 'Request path:' $SNARE_LOG | 
tr -s '\n' |
sort |
uniq -ic |
sort -gr > $SNARE_REQUEST_PATHS
