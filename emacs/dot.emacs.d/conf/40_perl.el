(el-get 'sync 'cperl-mode)
(defalias 'perl-mode 'cperl-mode)
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
 '(font-lock-maximum-decoration t)
 '(show-paren-mode t))
(add-to-list 'auto-mode-alist '("\\.tmpl$" . html-mode))
(add-to-list 'auto-mode-alist '("\\.pl$" . cperl-mode))
(add-to-list 'auto-mode-alist '("\\.pm$" . cperl-mode))
(add-to-list 'auto-mode-alist '("\\.t$" . cperl-mode))
; @@@
(add-hook 'cperl-mode-hook '(lambda ()
                              (setq indent-tabs-mode nil)
                              (local-set-key "\C-j" 'dabbrev-expand)
                              (local-set-key "\C-c\C-f" ' helm-find-files)
;;;;;                  (flymake-mode)
                              ))



;; auto 'perl -wc'
;; (add-hook 'after-save-hook 'run-perl-wc)
;; (defun run-perl-wc()
;;   (interactive)
;;   (let ((name (buffer-file-name)))
;;     (if (or (string-match "\\.pl$" name)
;;             (string-match "\\.pm$" name))
;;         (shell-command (concat "perl -wc -MFindBin::libs " name))
;;       )))

