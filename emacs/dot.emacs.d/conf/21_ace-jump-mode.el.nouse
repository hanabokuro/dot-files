(el-get 'sync 'avy)
(el-get 'sync 'ace-jump-mode)

;; (global-set-key (kbd "C-*") 'ace-jump-char-mode)

(defun add-keys-to-ace-jump-mode (prefix c &optional mode)
  (define-key global-map
    (read-kbd-macro (concat prefix (string c)))
    `(lambda ()
       (interactive)
       (funcall (if (eq ',mode 'word)
                    #'ace-jump-word-mode
                  #'ace-jump-char-mode) ,c))))

(loop for c from ?0 to ?9 do (add-keys-to-ace-jump-mode "C-M-S-" c))
(loop for c from ?a to ?z do (add-keys-to-ace-jump-mode "C-M-S-" c))
