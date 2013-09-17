;; ================ wanderlust ================
;; M-x elmo-passwd-alist-save
;; M-RET  wl-folder-update-recursive-current-entity
;; m s    wl-fldmgr-sort
;; e      mime-preview-extract-current-entity : 添付ファイルの保存
;; H      toggle-header
;; C-c C-j		wl-template-select
;; C-c C-x C-i  add multipart
;; C-c C-x C-t  add text file
;; /       open/close thread
;;
;; M-w     wl-summary-save-current-message
;; C-y     wl-summary-yank-saved-message)
;; ts      wl-thread-set-parent
;;

;; change folder format from 'user@server' to 'user%server'.
;; to allow user name like 'foo@gmail.com'.
(setq elmo-net-folder-name-syntax '((?% [server ".+"])
                                    (?: [port "^[0-9]+$"])
                                    (?! stream-type)))

(el-get 'sync 'wanderlust)
(setq wl-news-news-alist nil)
(setq wl-use-toolbar nil)
(setq elmo-net-folder-name-syntax '((?% [server ".+"])
                                    (?: [port "^[0-9]+$"])
                                    (?! stream-type)))
(autoload 'wl         "wl"         "Wanderlust" t)
(autoload 'elmo-split "elmo-split" "Split messages on the folder." t)
