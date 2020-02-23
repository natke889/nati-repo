#!/bin/bash
#add fix to exercise1 here
echo "nameserver 8.8.8.8" >> /etc/resolv.conf
route del 208.86.224.90
