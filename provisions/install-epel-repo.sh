#!/bin/bash
# repo --name="EPEL" --baseurl=http://download.fedoraproject.org/pub/epel/6/x86_64
sudo yum --assumeyes install http://dl.fedoraproject.org/pub/epel/6/x86_64/epel-release-6-8.noarch.rpm
sudo yum clean all
ls -l /etc/yum.repos.d/
