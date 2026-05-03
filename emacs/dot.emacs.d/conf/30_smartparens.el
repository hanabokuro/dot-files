;; コンパイラに「この関数はあとでロードされるから警告しないで」と伝える
(declare-function org-element-property "org-element")
(declare-function org-element-at-point "org-element")
(declare-function org-in-src-block-p "org")

(use-package smartparens
  :ensure t
  :hook (after-init . smartparens-global-mode)
  :config
  ;; 標準的な設定セット（smartparens-config.el）をロード
  (require 'smartparens-config)

  ;; キーバインドの設定：特に「Slurp/Barf」は構造編集の醍醐味です
  :bind (:map sp-keymap
              ("C-<right>" . sp-forward-slurp-sexp) ; 括弧を右に広げて単語を取り込む
              ("C-<left>"  . sp-forward-barf-sexp)  ; 括弧を左に縮めて単語を追い出す
              ("M-(" . sp-wrap-round)               ; リージョンを ( ) で包む
              ("M-[" . sp-wrap-square)              ; リージョンを [ ] で包む
              ("M-{" . sp-wrap-curly)))              ; リージョンを { } で包む
