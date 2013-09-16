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
; (define-key helm-map (kbd "C-i") 'undefined)

(add-hook 'eshell-mode-hook
          #'(lambda ()
              (define-key eshell-mode-map
                [remap eshell-pcomplete]
                'helm-esh-pcomplete)))

(global-set-key "\M-\C-y" 'helm-show-kill-ring)

(add-to-list 'helm-completing-read-handlers-alist '(find-file . nil))
(global-set-key "\C-c\C-f" ' helm-find-files)


(defvar my-helm-source-calculation-result
  '((name . "Calculation Result")
    (dummy)
    (type . 'string)
    (filtered-candidate-transformer . (lambda (candidates source)
                                        (list
                                         (condition-case nil
                                             (with-helm-current-buffer (calc-eval helm-pattern))
                                           (error "Error")))))
    (action . (("Copy result to kill-ring" . kill-new)))
))

(global-set-key "\C-xb" '(lambda ()
                           (interactive)
                           (require 'helm-files)
                           (helm-other-buffer '(
                                                helm-source-buffers-list
                                                helm-source-recentf
                                                helm-source-buffer-not-found
                                                my-helm-source-calculation-result
                                                )
                                              "*helm mini*")))

