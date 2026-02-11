;;; http://www.softantenna.com/wp/software/emacs-25-3/
;;; Emacs 25.3が緊急リリース - 任意のLispコードが実行可能な脆弱性が修正される
(eval-after-load "enriched"
  '(defun enriched-decode-display-prop (start end &optional param)
     (list start end)))

(setq default-directory (expand-file-name "~/")) ; osx cocoa emacs workaround.

(add-to-list 'load-path "~/.emacs.d/site-lisp")


;; HOW TO INSTALL PACKAGES
;; M-x el-get-installl


(require 'eieio)
;; setup package.el
(require 'package)
;; (add-to-list 'package-archives '("melpa" .     "http://melpa.milkbox.net/packages/"))
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/"))
(package-initialize)


;; el-get
;
; M-x el-get-self-update
; Update only one package, el-get itself.
;
; M-x el-get-emacswiki-build-local-recipes
; retrieve the index of elisp pages at emacswiki and turn them into a local recipe file set
;
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
(and (file-exists-p "~/.emacs.d/personal") (init-loader-load "~/.emacs.d/personal"))

;; other setting
(put 'narrow-to-region 'disabled nil)

(put 'set-goal-column 'disabled nil)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(cperl-close-paren-offset -4)
 '(cperl-continued-statement-offset 4)
 '(cperl-indent-level 4)
 '(cperl-indent-parens-as-block t)
 '(cperl-tab-always-indent t)
 '(display-time-mode t)
 '(eshell-ask-to-save-history 'always)
 '(eshell-cmpl-cycle-completions nil)
 '(eshell-hist-ignoredups t)
 '(eshell-history-size 1000)
 '(eshell-ls-exclude-regexp "~\\'")
 '(eshell-ls-initial-args "-h")
 '(eshell-modules-list
   '(eshell-alias eshell-basic eshell-cmpl eshell-dirs eshell-glob eshell-hist eshell-ls eshell-pred eshell-prompt eshell-rebind eshell-script eshell-term eshell-unix eshell-xtra))
 '(eshell-stringify-t nil)
 '(eshell-term-name "ansi")
 '(eshell-visual-commands
   '("vi" "vim" "top" "screen" "less" "lynx" "ssh" "rlogin" "telnet"))
 '(flycheck-display-errors-function #'flycheck-pos-tip-error-messages)
 '(font-lock-maximum-decoration t)
 '(helm-ag-base-command "ack --nocolor --nogroup")
 '(magit-fetch-arguments '("--prune") t)
 '(magit-log-arguments '("--graph" "--color" "--decorate" "-n256"))
 '(magit-merge-arguments '("--no-ff"))
 '(package-selected-packages
   '(haskell-mode company typescript-mode typoscript-mode rust-mode smart-compile))
 '(safe-local-variable-values '((dns-mode-soa-auto-increment-serial) (encoding . utf-8)))
 '(show-paren-mode t))

; (load (expand-file-name "~/.emacs.d/slack.el"))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(region ((t (:background "purple1")))))
