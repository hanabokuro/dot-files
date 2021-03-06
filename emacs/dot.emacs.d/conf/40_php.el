(el-get 'sync 'php-mode)

(add-hook 'php-mode-hook 'php-enable-psr2-coding-style)

(defun xrun-php-cs-fixer ()
  (interactive)
  (shell-command (concat "php-cs-fixer fix " (buffer-file-name) ""))
  (revert-buffer nil t))

(defun run-php-cs-fixer ()
  (interactive)
  (let (git-toplevel)
    (setq git-toplevel (replace-in-string (shell-command-to-string "git rev-parse --show-toplevel") "\n" ""))
    (if (string-match (concat git-toplevel "/\\(src\\|tests\\)/") (buffer-file-name))
        (progn
          (shell-command (format "/usr/local/bin/php-cs-fixer fix -q --config %s/.php_cs %s" git-toplevel (buffer-file-name) ""))
          (revert-buffer nil t))
      )
    (if (string-match (concat git-toplevel "/app/") (buffer-file-name))
        (progn
          (shell-command (format "/usr/local/bin/php-cs-fixer fix -q --config %s/.php_cs_legacy %s" git-toplevel (buffer-file-name) ""))
          (revert-buffer nil t))
      )
    ))

(add-hook 'php-mode-hook
          (lambda ()
            (add-hook 'after-save-hook 'run-php-cs-fixer nil 'make-it-local)))
