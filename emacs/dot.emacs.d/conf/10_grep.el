;; ripgrepをデフォルトのgrepコマンドとして設定
(setq grep-command "rg -H --no-heading --color=never ")

;; ripgrepをgrepのプログラムとして設定
(setq grep-program "rg")

;; grepの初期化関数をフックする
(with-eval-after-load 'grep
  (grep-apply-setting 'grep-command "rg -H --no-heading --color=never ")
  (grep-apply-setting 'grep-template "rg -H --no-heading --color=never <C> <F>"))
