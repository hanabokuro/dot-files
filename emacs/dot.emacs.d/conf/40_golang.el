(el-get 'sync 'go-mode)

(add-hook 'before-save-hook 'gofmt-before-save)
