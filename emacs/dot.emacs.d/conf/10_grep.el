;; rgコマンドの基本設定
(setq grep-command "rg -H --no-heading --color=never ")
(setq grep-program "rg")
(setq grep-use-null-device nil)

;; Emacs 28.2互換のカスタムrg関数
(defun my-rg-function (regexp)
  "Custom ripgrep function to run from project root and avoid file patterns being appended."
  (interactive
   (progn
     (grep-compute-defaults)
     (list (grep-read-regexp))))
  
  (let* ((project-root (locate-dominating-file default-directory ".git"))
         (default-directory (or project-root default-directory))
         (command (concat "rg -H --no-heading --color=never " 
                          (shell-quote-argument regexp))))
    (grep command)))

;; カスタムrg関数のキーバインド（C-x g）
(global-set-key (kbd "C-x g") 'my-rg-function)
