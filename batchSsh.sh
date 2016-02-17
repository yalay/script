#!/bin/bash

if [ $# != 1 ] ; then
    echo "USAGE: $0 cmd"
    exit 1;
fi

ips="10.200.95.28 10.200.95.29 10.200.95.30 10.200.95.31 10.200.95.38
    10.200.95.42 10.200.95.44 10.200.95.46"

cmd=$1
for ip in ${ips}; do
       echo ${ip};
       echo `ssh ${ip} ${cmd}`;
       echo "--------";
done

