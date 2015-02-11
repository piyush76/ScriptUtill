#!/bin/bash

#site=$1
type=$2

egrep $2 /var/lib/hannibal/sync/manifest/ems/ems_site.pp /var/lib/hannibal/sync/manifest/solr_islands/*.pp | grep -v '^#' | fgrep node | awk '{print $2}' | sed 's/"//g' | sort -u | fgrep messageone.com awk '{for (i = 1; i <= NF; i++) {if ($i < 0) { $i = -$i; } } print}'