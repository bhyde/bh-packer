#!/bin/bash
echo '#### setup quicklisp ####'
ccl <<EOF
$( curl http://beta.quicklisp.org/quicklisp.lisp )
(quicklisp-quickstart:install)
(let ((ql-util::*do-not-prompt* t))
  (ql:add-to-init-file))
(ql:quickload "quicklisp-slime-helper")
(ccl:quit)
EOF
exit 0
