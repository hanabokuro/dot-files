(require 'tramp)

(setq tramp-password-prompt-regexp "^.*\\([pP]assword\\|[pP]assphrase\\|Verification code\\).*: ? *")
(setq tramp-shell-prompt-pattern "\\(?:^\\|\\)[^]#$%>\n]*#?[]#$%>] *\\(\\[[0-9;]*[a-zA-Z] *\\)*")
