#!/bin/bash
echo "#### Success! ####"
/sbin/ifconfig -a | awk '/net addr:/{print $2}'
exit 0
