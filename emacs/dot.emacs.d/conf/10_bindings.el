;; quick dirty fold
(global-set-key [f1] '(lambda (column)
                        (interactive "P")
                        (set-selective-display
                         (if selective-display nil (or column 1)))))

;; rotate tab -width
(global-set-key "\C-xt" '(lambda ()
                           (interactive)
                           (setq tab-width
                                 (cond ((= tab-width 2) 4)
                                       ((= tab-width 4) 8)
                                       ( t 2)))
                           (recenter)))


;; custom key-binds
(global-set-key "\C-xc" 'compile)
(global-set-key "\C-j" 'dabbrev-expand)
(global-set-key "\C-z" 'scroll-down)
(global-set-key "\C-xg" 'grep)
(global-set-key (kbd "\C-x C") 'compile)
(global-set-key "\C-\\" 'undo)
(global-set-key "\C-xj" 'delete-horizontal-space)
(global-set-key "\C-x\C-j" 'toggle-input-method)
(global-set-key "\C-]" 'goto-line)
(global-unset-key "\C-x\C-z")
(global-set-key "\M-i" 'imenu)

(global-set-key [up] '(lambda () (interactive) (other-window -1)))
(global-set-key [down] 'other-window)
(global-set-key (kbd "C-x G") 'search-at-google)
