(setq elscreen-prefix-key "\C-x\C-\\")
(el-get 'sync 'elscreen)
(require 'elscreen)

(loop repeat 10 do (elscreen-create-internal t))
(elscreen-goto 0)

(global-set-key [left]  'elscreen-previous)
(global-set-key [right] 'elscreen-next)
