(setq directory-sep-char ?/)

(el-get 'sync 'wdired)
(define-key dired-mode-map "r" 'wdired-change-to-wdired-mode)
