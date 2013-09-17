(add-to-list 'load-path "~/.emacs.d/site-lisp")

;; setup package.el
(require 'package)
(add-to-list 'package-archives '("melpa" .     "http://melpa.milkbox.net/packages/"))
(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/"))
(package-initialize)

;; el-get
(add-to-list 'load-path "~/.emacs.d/el-get/el-get")

(unless (require 'el-get nil 'noerror)
  (with-current-buffer
      (url-retrieve-synchronously
       "https://raw.github.com/dimitri/el-get/master/el-get-install.el")
    (goto-char (point-max))
    (eval-print-last-sexp)))
(add-to-list 'el-get-recipe-path "~/.emacs.d/el-get-user/recipes")

(unless (file-exists-p "~/.emacs.d/elpa") (el-get-elpa-build-local-recipes))

;; init-loader
(el-get 'sync 'init-loader)
(setq init-loader-default-regexp "\\(?:^[[:digit:]]\\{2\\}\\).*\\.el\$") ;; default だと *.el~ も対象になってしまう。
(init-loader-load "~/.emacs.d/conf")

;; load personal setting
(let ((personal-dir "~/.emacs.d/personal"))
  (and (file-exists-p personal-dir) (mapc 'load (directory-files personal-dir :full-path "^[^#].*\\.elc?$"))))


;; other setting
(put 'narrow-to-region 'disabled nil)

