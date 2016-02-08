(el-get 'sync 'php-mode)

(add-hook 'php-mode-hook 'php-enable-psr2-coding-style)

(defun xrun-php-cs-fixer ()
  (interactive)
  (shell-command (concat "php-cs-fixer fix " (buffer-file-name) ""))
  (revert-buffer nil t))

(defun run-php-cs-fixer ())

(add-hook 'php-mode-hook
          (lambda ()
            (add-hook 'after-save-hook 'run-php-cs-fixer nil 'make-it-local)))
