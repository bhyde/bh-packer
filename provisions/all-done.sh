#!/bin/bash
echo "#### Success! ####"
sync; sync; sync
/sbin/ifconfig -a | awk '/net addr:/{print $2}'
exit 0
