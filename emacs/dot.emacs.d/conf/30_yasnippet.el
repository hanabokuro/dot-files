;; create and edit)
;; M-x yas/new-snippet        create new snippet. C-cC-c save.
;; M-x yas/visit-snippet-file
;;
;;
;; M-x yas/insert-snippet
;;
;;================================================================
;;
;; $1                    place holder
;; ${1:default value}
;; ${1:$$(yas-choose-value '("item1" "item2"))};
;;
;; update at `(current-time-string).        elisp
;;

;; yas-text                 Contains current field text.
;; yas-substr               Search PATTERN in STR and return SUBEXPth match.
;; yas-choose-value         Prompt for a string in POSSIBILITIES and return it.


(el-get 'sync 'yasnippet)
(yas-global-mode 1)
(mapcar '(lambda (path) (or (file-exists-p path) (make-directory path))) yas-snippet-dirs)
