(el-get 'sync 'mykie)

(mykie:set-keys global-map
  "C-x C-f"
  :default find-file
  :file    helm-find-files
  :url     browse-url
  )
