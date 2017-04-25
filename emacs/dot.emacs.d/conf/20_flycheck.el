(el-get 'sync 'flycheck)
(el-get 'sync 'pos-tip)
(el-get 'sync 'flycheck-pos-tip)

(eval-after-load 'flycheck
  (flycheck-pos-tip-mode)
  )

;; Perl
(add-hook 'perl-mode-hook 'flycheck-mode)

;; Ruby
(add-hook 'ruby-mode-hook 'flycheck-mode)

;; JavaScript
(add-hook 'js-mode-hook 'flycheck-mode)

;; php
(add-hook 'php-mode-hook 'flycheck-mode)
