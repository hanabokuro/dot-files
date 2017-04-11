(el-get 'sync 'go-mode)

(setq gofmt-command "gofmt")
(add-hook 'before-save-hook 'gofmt-before-save)
