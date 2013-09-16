;; install anthy if not exists
(unless (reduce '(lambda (v path) (or v (file-exists-p (concat path "/anthy-agent")))) exec-path :initial-value nil)
  (progn
    (el-get 'sync 'anthy)
    (add-to-list 'exec-path (concat (el-get-package-directory 'anthy) "usr/local/bin"))
    ))

(el-get 'sync 'tamago)
(require 'egg)
(load "leim-list")

(setq mlh-default-backend "anthy")
(global-set-key " " 'mlh-space-bar-backward-henkan)

