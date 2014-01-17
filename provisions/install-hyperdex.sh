#!/bin/bash

echo '#### hyperdex install ####'
trap 'echo leaving hyperdex install' EXIT
set -o nounset -o errexit -o verbose

### Add the repo and have yum install it.

cat <<'EOF' > /etc/yum.repos.d//hyperdex.repo
[hyperdex]
name=hyperdex
baseurl=http://centos.hyperdex.org/base/$basearch/$releasever
enabled=1
gpgcheck=0
EOF
yum clean all
ls -l /etc/yum.repos.d/
yum --assumeyes install hyperdex
ls -l /etc/yum.repos.d/
