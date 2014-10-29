#!/bin/bash
set -x #echo on

cassandra_home=/opt/dse/dse-4.5.2

echo "users"
$cassandra_home/bin/cqlsh -f other/user.txt
