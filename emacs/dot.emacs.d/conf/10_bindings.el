;;; --- 1. Quick & Dirty Fold (選択的表示) ---
(defun my/toggle-selective-display (column)
  "インデントの深さで折り畳みを切り替える。"
  (interactive "P")
  (set-selective-display
   (if selective-display nil (or column 1))))

;;; --- 2. Rotate Tab-Width (2 -> 4 -> 8) ---
(defun my/rotate-tab-width ()
  "tab-width を 2, 4, 8 の順で回す。"
  (interactive)
  (setq tab-width (cond ((= tab-width 2) 4)
                        ((= tab-width 4) 8)
                        (t 2)))
  (redraw-display)) ; recenter より確実に再描画


;; --- 基本キーバインド ---
(keymap-global-set "C-j"   'dabbrev-expand)
(keymap-global-set "C-\\"  'undo)
(keymap-global-set "C-]"   'goto-line)

;; --- ウィンドウ・バッファ操作 ---
(keymap-global-set "<up>"    (lambda () (interactive) (other-window -1)))
(keymap-global-set "<down>"  'other-window)

;; --- C-x プレフィックス系 ---
(keymap-global-set "C-x c"   'compile)
(keymap-global-set "C-x C"   'compile)
(keymap-global-set "C-x j"   'delete-horizontal-space)
(keymap-global-set "C-x t"   'my/rotate-tab-width)
(keymap-global-set "C-x G"   'my/search-at-google)

(keymap-global-set "C-x g" 'grep)

 (keymap-global-set "C-z" 'scroll-down)

;; [F1] フォルダ切り替え
(keymap-global-set "<f1>" 'my/toggle-selective-display)
