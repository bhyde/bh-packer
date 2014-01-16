#!/bin/bash

### Add the repo and have yum install it.

cat <<'EOF' > /tmp/hyperdex.repo
[hyperdex]
name=hyperdex
baseurl=http://centos.hyperdex.org/base/$basearch/$releasever
enabled=1
gpgcheck=0
EOF
sudo chown root:root /tmp/hyperdex.repo
sudo mv /tmp/hyperdex.repo /etc/yum.repos.d/
sudo yum clean all
ls -l /etc/yum.repos.d/
sudo yum --assumeyes install hyperdex
ls -l /etc/yum.repos.d/

