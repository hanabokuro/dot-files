
(setq auto-mode-alist (cons '("\\.v$" . coq-mode) auto-mode-alist))
(autoload 'coq-mode "coq" "Major mode for editing Coq vernacular." t)

;; proof-general
;; (el-get 'sync 'proof-general)
(require 'pg-init)

;; C-c C-n	1ステップ進む
;; C-c C-u	1ステップ戻る
;; C-c C-Enter	カーソル位置まで進める
;; C-c C-a C-o	SearchPattern
;; C-c C-a C-p	Print
;; C-c C-a C-c	Check
;; C-c C-a C-s	Show
;; C-c C-a C-l	Locate
;; C-c C-c	現在の評価プロセスを中断する

;; http://proofcafe.org/wiki/ProofGeneral/Keybinds
