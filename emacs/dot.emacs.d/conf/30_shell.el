(add-hook 'shell-mode-hook  '(lambda () (define-key shell-mode-map "\C-c\C-f" 'helm-find-files)))

(el-get 'sync 'bash-completion)

;(require 'bash-completion)
;(bash-completion-setup)
