(use-package dmacro
  :ensure t
  ;; キーバインドの設定（従来の global-set-key と autoload を兼ねます）
  :bind ("C-o" . dmacro-exec)
  :init
  ;; 必要に応じて、グローバルマイナーモードを有効化（最近のバージョンでは推奨）
  (when (fboundp 'global-dmacro-mode)
    (global-dmacro-mode 1)))
