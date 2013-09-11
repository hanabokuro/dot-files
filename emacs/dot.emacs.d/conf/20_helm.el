;;
;; @		helm will search for text matching this pattern INSIDE the buffer (i.e not in the name of buffer).
;; Left		Previous Source
;; Right	 Next Source
;;
;; M-x helm-locate
;;
;;

(require 'helm-config)

(global-set-key "\C-xb" 'helm-mini)
(helm-mode 1)

(add-to-list 'helm-completing-read-handlers-alist '(find-file . nil))

 (define-key helm-map (kbd "C-i") 'undefined)

(add-hook 'eshell-mode-hook
          #'(lambda ()
              (define-key eshell-mode-map
                [remap eshell-pcomplete]
                'helm-esh-pcomplete)))

(global-set-key "\M-\C-y" 'helm-show-kill-ring)
(global-set-key "\C-c\C-f" 'helm-find-files)
