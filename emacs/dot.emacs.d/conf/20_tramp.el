(el-get 'sync 'vagrant-tramp)

(eval-after-load 'tramp '(vagrant-tramp-enable))

(require 'tramp)

(setq tramp-password-prompt-regexp "^.*\\([pP]assword\\|[pP]assphrase\\|Verification code\\).*: ? *")
