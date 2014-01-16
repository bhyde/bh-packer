#!/bin/bash
echo '####### emacs init #######'
USER=bhyde
DIR=/home/$USER/.emacs.d
mkdir -p $DIR
cat > $DIR/init.el <<'EOF'
(defun path-from-my-home (epilog)
  (concat (getenv "HOME") epilog))
(require 'cl)
(add-to-list 'load-path (path-from-my-home "/.emacs.d"))
(require 'package) ;; requires emacs 24
(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/"))
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/"))
(setf dired-listing-switches "-la -t")
(load (expand-file-name "~/quicklisp/slime-helper.el"))
(setq inferior-lisp-program "ccl")
(slime-setup '(slime-fancy slime-asdf))
(defun setup-to-save-swank-fasls-in-asdf-cache () 
  ;; based on http://article.gmane.org/gmane.lisp.slime.devel/11080
  (slime-eval-print "
     (flet ((find-fasl (path options)
                       (declare (ignore options))
                       (let ((fasl-path
                               (asdf:apply-output-translations
                                   (compile-file-pathname path))))
                         (when fasl-path
                           (ensure-directories-exist fasl-path)
                           fasl-path))))
       (let (fasl-finder-sym)
         (when (and (find-package :swank)
                    (setq fasl-finder-sym
                          (find-symbol \"*FASL-PATHNAME-FUNCTION*\" :swank))
                    (null (symbol-value fasl-finder-sym)))
           (set fasl-finder-sym #'find-fasl))))"))
(require 'slime)
(add-to-list 'slime-connected-hook 'setup-to-save-swank-fasls-in-asdf-cache)
EOF
rm -f ~/.emacs
exit 0
