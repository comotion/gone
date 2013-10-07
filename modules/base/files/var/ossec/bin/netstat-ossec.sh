#!/bin/sh
#
# check for server connections
# http://groups.google.com/group/ossec-list/browse_thread/thread/402e04bf25f089e7
#
# atrocious awk
echo "server connections: "
netstat -lnp | grep -E 'udp|tcp' | awk '{print $1,$4,$6,$7}'| \
  awk '{sub(/[: \t]+$/, "")};1' | awk '{sub(/ LISTEN/, "")};1'| \
  awk 'BEGIN { FS = "[/ \t]" } ; { print $1,$2,$4 }' 

