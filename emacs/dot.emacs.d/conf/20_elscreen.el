;; elscreen は使わない

(use-package tab-bar
  :ensure nil
  :init
  (tab-bar-mode 1)
  :config
  ;; --- 10個のタブ（スクリーン）を生成 ---
  ;; すでに1つ目のタブは存在しているため、追加で9個作成します
  (dotimes (_ 9)
    (tab-new))
  
  ;; 最初のタブ（インデックス1）を選択した状態にする
  (tab-bar-select-tab 1)

  ;; --- キーバインドの設定 ---
  ;; カーソルキー（左右）でタブを移動
  (keymap-global-set "<left>"  'tab-bar-switch-to-prev-tab)
  (keymap-global-set "<right>" 'tab-bar-switch-to-next-tab)
  
  )
