;; スタートアップ時のメッセージを抑制
(setq inhibit-startup-message t)

;; メニューバーとツールバーoff
(tool-bar-mode 0)
(menu-bar-mode 1)

;; ヴィジュアルベル無効
(setq visible-bell nil)

;; ビープ音も無効
(setq ring-bell-function '(lambda ()))

;; 行数、列数を表示
(line-number-mode t)
(column-number-mode t)

;; リージョンをC-hで削除
(delete-selection-mode 1)

;; インデントはスペースで
(setq-default indent-tabs-mode nil)

;; C-hでバックスペース
(load-library "term/bobcat")
(terminal-init-bobcat)

;; スクロールバー非表示
(scroll-bar-mode nil)

;; 対応する括弧を光らせる
(show-paren-mode 1)

;; 色つける
(global-font-lock-mode t)
(setq-default transient-mark-mode t)
(require 'font-lock)

;; 一行ずつスクロール
(setq scroll-step 1)

;; アクティブでないバッファではカーソルを出さない
(setq cursor-in-non-selected-windows nil)

;; recenf-mode
(recentf-mode t)

;; default to unified diffs
(setq diff-switches "-u")

;; auto chmod +x
(add-hook 'after-save-hook 'executable-make-buffer-file-executable-if-script-p)

; ignore case with file name completion 
(setq read-file-name-completion-ignore-case t)
(setq completion-ignore-case t)

;; X Windows Systemではクリップボードに3種類のバッファが用意されており、コピー方法によって使用するバッファが異なる。
;; PRIMARY
;; マウスでテキストを反転させてコピーした場合
(setq x-select-enable-primary t)

;; SECONDARY
;; (未使用)

;; CLIPBOARD
;; マウスでテキストを反転させ、右クリックしてコピーを選択した場合
(setq x-select-enable-clipboard t)

; 範囲選択するだけでコピーするのを無効に
(setq select-active-regions nil)

;; 暫定マークモードを on にする
(setq transient-mark-mode t)

;; dabbrevで大文字小文字を無視して候補を出す
(setq dabbrev-case-replace nil)

;; ステータスバーに日付と時刻を24時間表記で表示する
(setq display-time-day-and-date t)
(setq display-time-24hr-format t)
(display-time)

;; defaultのgrepコマンド
(setq grep-command "ack -i -C 2 --nogroup --nocolor ")
;(setq grep-command "ack -i -C 2 --nogroup --nocolor --type-set c=.c,.h,.cc --type=perl ")
;(setq grep-command "ag -i --line-number --nogroup ")
;; コマンド末尾に /dev/null をつけない
(setq grep-use-null-device nil)

;; emacs終了時に yes/no を聞く
(setq confirm-kill-emacs 'yes-or-no-p)

;; TAB key押下時は cycle じゃなくて候補を表示
(setq pcomplete-cycle-completions nil)

;; make buffer-name uniq
(require 'uniquify)
(setq uniquify-buffer-name-style 'post-forward-angle-brackets)

;; tab width
(setq-default tab-width 4 indent-tabs-mode nil)

;; revert any buffer associated with a file when the file changes on disk
(global-auto-revert-mode 1)

;; Go down one level like unix command `cd ..'.
(define-key minibuffer-local-filename-completion-map "\C-l" '(lambda () (interactive) (insert-string (concat (helm-reduce-file-name (delete-and-extract-region (minibuffer-prompt-end) (point-max)) 1 ) "/"))))
