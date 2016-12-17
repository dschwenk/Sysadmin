#!/bin/bash
SNARE_LOG="/home/mstroh/snare/snare.log"
SNARE_POST="/home/mstroh/logs/snare-post.txt"
SNARE_REQUEST_PATHS="/home/mstroh/logs/snare-request-paths.txt"

# extract POST-requests
grep 'POST data:' $SNARE_LOG | sort > $SNARE_POST

# extract request-paths
grep 'Request path:' $SNARE_LOG | sort > $SNARE_REQUEST_PATHS
