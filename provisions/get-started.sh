#!/bin/bash

echo "#### Get started with provisioning..." 
echo "Nap 5 seconds to let startup settle..."
sleep 5
echo " -----"
/sbin/ifconfig -a | awk '/net addr:/{print $2}'
echo "Who: $(whoami)"
echo "Where: $(pwd)"
echo " -----"
echo " Networking's setup:"
/sbin/ifconfig -a
exit 0

