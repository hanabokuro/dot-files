;;
;;
;; > cd ~/.emacs.d/site-lisp
;; > git clone https://github.com/dimitri/el-get


;; ;; install init-loader.el
;; (defun fetch-and-save (url filename)
;;   (let (buffer)
;;     (setq buffer (url-retrieve-synchronously url))
;;     (switch-to-buffer buffer)

;;     (goto-char (point-min))(search-forward "\n\n")(kill-region (point-min) (point)) ;; delete http headers

;;     (write-file filename)
;;     (kill-buffer buffer)
;;     ))
;; (fetch-and-save "https://github.com/emacs-jp/init-loader/raw/master/init-loader.el" "~/.emacs.d/site-lisp/init-loader.el")


;; ;; install melpa
;; (progn
;;   (switch-to-buffer (url-retrieve-synchronously "https://raw.github.com/milkypostman/melpa/master/melpa.el"))
;;   (package-install-from-buffer  (package-buffer-info) 'single)
;; )

;; ;; install packages
;; (package-list-packages)
;; (mapcar 'package-install '(
;;                            ace-jump-mode
;;                            escreen
;;                            git-commit-mode
;;                            auto-complete
;;                            git-gutter
;;                            session
;;                            pcmpl-git
;;                            expand-region
;;                            helm
;;                            popwin
;;                            magit
;;                            color-theme
;;                            redo+
;;                            magit
;;                            ))
