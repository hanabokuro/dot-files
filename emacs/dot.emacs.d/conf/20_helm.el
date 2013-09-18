;;
;; @		helm will search for text matching this pattern INSIDE the buffer (i.e not in the name of buffer).
;; Left		Previous Source
;; Right	 Next Source
;;
;; M-x helm-locate
;;
;;
;; @helm-find-files
;; C-. or C-l         go up directory
;; C-z                select directory
;; C-c ?              show help
;;

(el-get 'sync 'helm)
(require 'helm-config)

(helm-mode 1)
(define-key helm-read-file-map (kbd "<tab>") 'helm-execute-persistent-action)

(add-hook 'eshell-mode-hook
          #'(lambda ()
              (define-key eshell-mode-map
                [remap eshell-pcomplete]
                'helm-esh-pcomplete)))

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
