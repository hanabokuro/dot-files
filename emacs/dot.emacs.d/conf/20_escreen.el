(setq escreen-prefix-char "\C-x\C-\\")
(el-get 'sync 'escreen)
(escreen-install)

(and
 (escreen-first-unused-screen-number)
 (let ((n 1))
   (while (< n escreen-max-screens)
     (escreen-create-screen) ; @@@
     (setq n (1+ n))
     ))
 )
(escreen-goto-screen 0)
(global-set-key [left] 'escreen-goto-prev-screen)
(global-set-key [right] 'escreen-goto-next-screen)
(global-set-key [up] '(lambda ()
                        (interactive)
                        (other-window -1)))
(global-set-key [down] 'other-window)
(let ((n 0))
  (while (<= n 9)
    (global-set-key (format "\C-c%d" n)  `(lambda () (interactive) (escreen-goto-screen ,n)))
    (setq n (1+ n))))


