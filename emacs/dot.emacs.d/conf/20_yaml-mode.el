(el-get 'sync 'yaml-mode)

(add-hook 'yaml-mode-hook '(lambda () (setq require-final-newline 'visit-save)))
