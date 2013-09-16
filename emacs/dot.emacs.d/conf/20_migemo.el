(unless (reduce '(lambda (v path) (or v (file-exists-p (concat path "/cmigemo")))) exec-path :initial-value nil)
  (error "cmigemo binary not found. please install.")) ;; 'brew install cmigemo'

(el-get 'sync 'migemo)

(require 'migemo)

(setq migemo-command "cmigemo")
(setq migemo-options '("-q" "--emacs"))
(setq migemo-dictionary "/usr/local/share/migemo/utf-8/migemo-dict")
(setq migemo-user-dictionary nil)
(setq migemo-regex-dictionary nil)
(setq migemo-coding-system 'utf-8-unix)
(migemo-init)



