#!/bin/bash
/usr/sbin/init
truncate -s 0 /etc/hosts
cat etc/hosts.back /etc/srv-hosts > /etc/hosts
/bin/bash