;; load-path
(add-to-list 'load-path "~/.emacs.d/site-lisp")
(let ((default-directory "~/.emacs.d/site-lisp"))
  (normal-top-level-add-subdirs-to-load-path))


(require 'init-loader)
(setq init-loader-default-regexp "\\(?:^[[:digit:]]\\{2\\}\\).*\\.el\$") ;; default だと *.el~ も対象になってしまう。
(init-loader-load "~/.emacs.d/conf")
(put 'narrow-to-region 'disabled nil)

(load-library "personal-setting.el")
