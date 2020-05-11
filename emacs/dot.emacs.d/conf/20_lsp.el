;;
;; completion-at-point - display completion using built-in emacs completion-at-point framework.
;;
;; *vars*
;; (defcustom lsp-enable-file-watchers t
;; (defcustom lsp-file-watch-threshold 1000
;;

(el-get 'sync 'lsp-mode)
(el-get 'sync 'lsp-ui)

;; for PHP
;;
;; $ npm i intelephense -g

(use-package company
  :ensure t
  :config
  (setq company-idle-delay 0.3)
;;  (global-set-key (kbd "C-<tab>") 'company-complete)
  (global-company-mode 1)
  )

(use-package flycheck)

(use-package lsp-mode
  :config
  (setq lsp-prefer-flymake nil)
  :hook (php-mode . lsp)
  :hook (golang-mode . lsp)
  :hook (typescript-mode . lsp)
  :bind
  (:map lsp-mode-map
        ("C-c C-j" . lsp-ui-peek-find-definitions)
        ("C-c b"   . xref-pop-marker-stack)
        ("C-c i"   . lsp-ui-peek-find-implementation)
        ("C-c m"   . lsp-ui-imenu)
        ("C-<tab>" . 'completion-at-point)
        )
  :commands lsp)

(use-package lsp-ui
  :requires lsp-mode flycheck
  :commands lsp
  :config
  (setq lsp-ui-doc-enable t
        lsp-ui-doc-use-childframe t
        lsp-ui-doc-position ‘top
        lsp-ui-doc-include-signature t
        lsp-ui-sideline-enable nil
        lsp-ui-flycheck-enable t
        lsp-ui-flycheck-list-position ‘right
        lsp-ui-flycheck-live-reporting t
        lsp-ui-peek-enable t
        lsp-ui-peek-list-width 60
        lsp-ui-peek-peek-height 25
        lsp-ui-sideline-enable nil)

  (add-hook ‘lsp-mode-hook ‘lsp-ui-mode))

(use-package company-lsp
  :commands company-lsp)
