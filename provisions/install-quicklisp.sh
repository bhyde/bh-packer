#!/bin/bash
echo '#### setup quicklisp for bhyde ####'

USER=bhyde

cat <<EOF > /tmp/setup-quicklisp
$( curl http://beta.quicklisp.org/quicklisp.lisp )
(quicklisp-quickstart:install)
(let ((ql-util::*do-not-prompt* t))
  (ql:add-to-init-file))
(ql:quickload "quicklisp-slime-helper")
(ccl:quit)
EOF

cd /home/$user
sudo -u $user ccl < /tmp/setup-quicklisp
rm /tmp/setup-quicklisp
exit 0
