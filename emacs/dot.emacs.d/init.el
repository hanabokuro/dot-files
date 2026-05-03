;;; --- Emacs 30 標準パッケージ管理設定 ---

;; パッケージ管理の初期化
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)

;; package-install 時に自動でリポジトリから取得
(unless package-archive-contents
  (package-refresh-contents))

;; use-package を有効化 (Emacs 29/30 は標準搭載)
(require 'use-package)
(setq use-package-always-ensure t)

;; conf ディレクトリをロードパスに追加
(let ((default-directory (expand-file-name "conf" user-emacs-directory)))
  (add-to-list 'load-path default-directory)

  ;; conf/*.el をファイル名順（00, 10, 20...）に読み込む
  (dolist (file (directory-files default-directory t "\\.el$"))
    (load file)))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages nil)
 '(package-vc-selected-packages
   '((egg :url "https://github.com/hanabokuro/tamago" :branch "master"))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
