(el-get 'sync 'anzu)

(global-anzu-mode +1)
(setq anzu-use-migemo t)
(setq anzu-search-threshold 1000)
(setq anzu-minimum-input-length 3)

(defalias 'qrr 'anzu-query-replace-regexp)
