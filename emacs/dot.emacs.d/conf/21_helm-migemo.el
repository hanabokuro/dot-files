(el-get 'sync 'helm-migemo)
(require 'helm-migemo)

(define-key isearch-mode-map (kbd "C-o") 'helm-occur-from-isearch)

