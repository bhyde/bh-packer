#!/bin/bash
echo '#### Install Miniconda ####'
trap 'echo "leaving install miniconda"' EXIT
set -o nounset -o errexit -o verbose
cd /usr/local/src
SCRIPT=Miniconda3-3.0.0-Linux-x86_64.sh
FROM=http://repo.continuum.io/miniconda
TO=/usr/local/src/miniconda3
curl --silent --remote-name $FROM/$SCRIPT
file $SCRIPT
ls -l $SCRIPT
head -20 $SCRIPT
bash $SCRIPT -b -p $TO
rm $SCRIPT
cat <<EOF > /etc/profile.d/miniconda.sh
pathmunge $TO
export PATH
EOF
