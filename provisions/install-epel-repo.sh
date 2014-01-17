#!/bin/bash
echo '#### Add EPEL repo ####'
trap 'echo leaving adding EPEL repo' EXIT
set -o nounset -o errexit -o verbose
yum --assumeyes install http://dl.fedoraproject.org/pub/epel/6/x86_64/epel-release-6-8.noarch.rpm
yum clean all
ls -l /etc/yum.repos.d/
