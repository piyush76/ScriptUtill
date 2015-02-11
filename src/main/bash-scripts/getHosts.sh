#!/bin/bash

####################################
Usage :

###./getHosts.sh <server query>
# ./gethost.sh work

#######################################

grep $1 /var/lib/hannibal/sync/manifest/ems/ems_site.pp  /var/lib/hannibal/sync/manifest/solr_islands/*.pp | fgrep node | awk '{print $2}' | fgrep messageone.com | sed 's/"//g' | sort -u
