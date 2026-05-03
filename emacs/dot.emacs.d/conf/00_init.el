;; 行末の余計な空白を削除し、ファイル末尾を 1 行（改行のみ）に整える
(setq delete-trailing-lines t) ; ファイル末尾の空行を削除する
(add-hook 'before-save-hook #'delete-trailing-whitespace)
(setq require-final-newline t) ; 保存時に必ずファイル末尾を改行で終わらせる


(defvar run-linux (equal system-type 'gnu/linux))
(defvar run-cli (equal window-system nil))
(defvar run-x11 (equal window-system 'x))
(defvar run-mac (eq system-type 'darwin))
(defvar run-gui (display-graphic-p)) ; window-system よりも現代的な判定

(when (eq system-type 'darwin)
  ;; Apple Silicon Mac で最も美しく高速なフォント指定
  ;; 'height 140 は 14pt 相当
  (set-face-attribute 'default nil :family "SF Mono" :height 140)
  ;; 日本語フォントを「ヒラギノ角ゴ」に固定する場合
  (set-fontset-font nil 'japanese-jisx0208 (font-spec :family "Hiragino Sans")))

;; 1. 日本語環境の基本設定
(set-language-environment "Japanese")

;; 2. 文字コードの優先順位を「Unicode(UTF-8)」に固定する
;; 現代の Emacs における最も強力で包括的な設定です
(prefer-coding-system 'utf-8)
(set-default-coding-systems 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)

;; 3. [今風の追加] クリップボードやファイル名も UTF-8 で統一
(set-selection-coding-system 'utf-8)
(setq file-name-coding-system 'utf-8)
(setq default-process-coding-system '(utf-8 . utf-8))
