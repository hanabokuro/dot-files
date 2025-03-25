;; rgをプロジェクトルートから実行する関数
(defun rg-from-project-root ()
  "Run ripgrep from the project root directory (.git directory location) or current directory."
  (interactive)
  (let* ((project-root (locate-dominating-file default-directory ".git"))
         (default-directory (or project-root default-directory))
         (grep-command "rg -H --no-heading --color=never "))
    (call-interactively 'grep)
    (with-current-buffer "*grep*"
      (rename-buffer (format "*rg [%s]*" (file-name-nondirectory (directory-file-name default-directory)))))))

;; 標準のgrepコマンドをオーバーライド
(advice-add 'grep :around
            (lambda (orig-fun &rest args)
              (let* ((project-root (locate-dominating-file default-directory ".git"))
                     (default-directory (or project-root default-directory)))
                (apply orig-fun args))))

(global-set-key (kbd "C-x g") 'rg-from-project-root)
