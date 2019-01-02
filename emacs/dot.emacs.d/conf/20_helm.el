;; https://github.com/emacs-helm/helm/wiki
;;
;; Left		Previous Source
;; Right	 Next Source
;;
;; M-x helm-locate
;;
;;
;; @helm-grep
;;
;; @helm-find-files
;; C-. or C-l         go up directory
;; C-z                select directory
;; C-c ?              show help
;;

(setq helm-command-prefix-key "C-x C") ;; default is C-x c. but it will be bound to smarter-compile.
(el-get 'sync 'helm)
(require 'helm-config)
(require 'helm-for-files)

(helm-mode 1)
(define-key helm-find-files-map (kbd "<tab>") 'helm-execute-persistent-action)

(add-hook 'eshell-mode-hook
          #'(lambda ()
              (define-key eshell-mode-map
                [remap eshell-pcomplete]
                'helm-esh-pcomplete)))

;; tag jump
(global-set-key (kbd "M-.") 'helm-etags-select)

;; king ring
(global-set-key "\M-\C-y" 'helm-show-kill-ring)

;; find file
(add-to-list 'helm-completing-read-handlers-alist '(find-file . nil))
(global-set-key "\C-c\C-f" ' helm-find-files)

;; other buffer
(setq my-helm-source-list-for-helm-other-buffer '(
                                                  helm-source-buffers-list
                                                  helm-source-recentf
                                                  helm-source-buffer-not-found
                                                  ))
(global-set-key "\C-xb" '(lambda ()
                           (interactive)
                           (require 'helm-files)
                           (helm-other-buffer
                            my-helm-source-list-for-helm-other-buffer
                            "*helm mini*")))

;;
;; Helm をストレスなく使うための個人的な設定 - あらびき日記 http://d.hatena.ne.jp/a_bicky/20140104/1388822688
;;
;; Emulate `kill-line' in helm minibuffer
(setq helm-delete-minibuffer-contents-from-point t)
(defadvice helm-delete-minibuffer-contents (before helm-emulate-kill-line activate)
  "Emulate `kill-line' in helm minibuffer"
  (kill-new (buffer-substring (point) (field-end))))
