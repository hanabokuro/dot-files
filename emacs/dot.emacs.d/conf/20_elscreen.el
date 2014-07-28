(setq elscreen-prefix-key "\C-x\C-\\")
(el-get 'sync 'emacs-jp-elscreen)
(require 'elscreen)

(elscreen-start)
(loop repeat 10 do (elscreen-create))
(elscreen-goto 0)

(global-set-key [left]  'elscreen-previous)
(global-set-key [right] 'elscreen-next)
(global-set-key "\C-c0" '(lambda () (interactive) (elscreen-jump-0)))
