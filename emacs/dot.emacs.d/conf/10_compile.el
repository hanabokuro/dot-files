;; makeをプロジェクトルートから実行する関数
(defun make-from-project-root ()
  "Run make command from the project root directory (.git directory location) or current directory."
  (interactive)
  (let* ((project-root (locate-dominating-file default-directory ".git"))
         (default-directory (or project-root default-directory)))
    (call-interactively 'compile)))

;; compileコマンドをプロジェクトルートから実行するように設定
(advice-add 'compile :around
            (lambda (orig-fun &rest args)
              (let* ((project-root (locate-dominating-file default-directory ".git"))
                     (default-directory (or project-root default-directory)))
                (apply orig-fun args))))

(global-set-key (kbd "C-x c") 'make-from-project-root)
