;; Expand region increases the selected region by semantic units. Just keep
;; pressing the key until it selects what you want.
(el-get 'sync 'expand-region)
(global-set-key (kbd "C-=") 'er/expand-region)
