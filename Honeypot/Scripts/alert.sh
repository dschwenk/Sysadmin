#!/bin/bash

echo "Someone accessed our SSH honeypot running on port 22" | mailx -v \
-r "honeypot-notification@danielschwenk.de" \
-s "SSH Honeypot Notification" \
-S smtp="send.one.com" \
-S smtp-use-starttls \
-S smtp-auth=login \
-S smtp-auth-user="honeypot-notification@danielschwenk.de" \
-S smtp-auth-password="pwnX23st" \
-S ssl-verify=ignore \
michael.stroh@hs-weingarten.de,daniel.schwenk@hs-weingarten.de
