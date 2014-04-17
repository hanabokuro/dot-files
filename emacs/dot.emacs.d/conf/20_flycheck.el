(el-get 'sync 'flycheck)
(el-get 'sync 'flycheck-pos-tip)

(eval-after-load 'flycheck
  '(custom-set-variables
   '(flycheck-display-errors-function #'flycheck-pos-tip-error-messages)))

;; Perl
(add-hook 'perl-mode-hook 'flycheck-mode)

;; Ruby
(add-hook 'ruby-mode-hook 'flycheck-mode)

