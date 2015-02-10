#!/usr/bin/perl -w

use Cwd;
use File::Path;
use Getopt::Std;

if ($#ARGV != 0 ) {
        print "usage: create <stop|start|restart|service>\n";
        exit;
}


#Variable declarations.
my $action = $ARGV[0];

if ($action eq "service") {
  my $cmd1 = `cat hostlist.txt | ender status | grep -v puppet | grep -v ender | grep -v postgres | grep -v tomcat | grep -v zookeeper | grep -v voltdb | grep -v cassandra | awk '{print \$2}' | sort -u | (awk '{ORS=","}{print \$0}';echo "tomcat") > servicelist.txt`
} else {
  my $cmd1 = `cat hostlist.txt | ender status | grep -v -E "zookeeper|puppet|ender|gmond|ganglia|mon-svc-down|splunkd|ncsd|postgres|voltdb|cassandra|ERROR" | awk '{print \$1 \" \" \$2 \" $action\"}' > $action-services.txt`;
}
