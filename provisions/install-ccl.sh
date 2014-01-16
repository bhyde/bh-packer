#!/bin/bash
echo '#### Build CCL/OpenMCL ####'
cd /usr/local/src
sudo tar xzf /tmp/ccl.tgz
sudo chown -R root:root /usr/local/src/ccl
sudo ln -s /usr/local/src/ccl/scripts/ccl64 /usr/local/bin/ccl
exit 0

## Note you need to build ccl on the target OS, following
## the usual directions (svn, rebuild, etc) then tar up
## the ccl directory and put it in provisions/ccl.tgz
## The above meerly uppacks that.  The packer template
## copies the file before this runs.

