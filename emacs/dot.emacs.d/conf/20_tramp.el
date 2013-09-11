(require 'tramp)

;; HOST USER PROXY
(add-to-list 'tramp-default-proxies-alist
             '("." "bkssh" "/ssh:shigeki.morimoto@siau:"))

(add-to-list 'tramp-default-proxies-alist
             '("." "deploy" "/ssh:shigeki.morimoto@siau:"))

(add-to-list 'tramp-default-proxies-alist
             '("ds0029" "morimoto" "/ssh:shigeki.morimoto@siau:"))

; M-x find-file /ssh:deploy@10.63.242.15:
; M-x find-file /ssh:morimoto@ds0029:

;; test_deploy_server
; M-x find-file /ssh:deploy@10.63.242.17:

;; morimoto_deploy_test
; M-x find-file /ssh:deploy@10.63.242.29:

;; main work fc17
; M-x find-file /ssh:bkssh@mainwork:

;; hive
; M-x find-file /ssh:bkssh@a04688:
