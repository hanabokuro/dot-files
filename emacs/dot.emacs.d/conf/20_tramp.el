(require 'tramp)

(setq tramp-password-prompt-regexp "^.*\\([pP]assword\\|[pP]assphrase\\|Verification code\\).*: ? *")

(add-to-list 'backup-directory-alist (cons tramp-file-name-regexp nil))
(setq tramp-auto-save-directory temporary-file-directory)
(setq tramp-verbose 10)
