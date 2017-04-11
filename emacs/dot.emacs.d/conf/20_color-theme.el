;; color-theme
(el-get 'sync 'color-theme)
(color-theme-initialize)
;; (color-theme-robin-hood)
;; (color-theme-clarity) ;; for putty 256mode

;;; http://jasonm23.github.com/emacs-theme-editor/
(defun color-theme-hanabokuro ()
  (interactive)
  (color-theme-install
   '(hanabokuro
      ((background-color . "#e6e6e5")
      (background-mode . light)
      (border-color . "#1a1a1a")
      (cursor-color . "#746b1a")
      (foreground-color . "#494904")
      (mouse-color . "black"))
     (fringe ((t (:background "#1a1a1a"))))
     (mode-line ((t (:foreground "#eeeeec" :background "#555753"))))
     (region ((t (:background "#bcd2c1"))))
     (font-lock-builtin-face ((t (:foreground "#1a487a"))))
     (font-lock-comment-face ((t (:foreground "#7f1a76"))))
     (font-lock-function-name-face ((t (:foreground "#3b761e"))))
     (font-lock-keyword-face ((t (:foreground "#205083"))))
     (font-lock-string-face ((t (:foreground "#511565"))))
     (font-lock-type-face ((t (:foreground"#3c6615"))))
     (font-lock-constant-face ((t (:foreground "#704519"))))
     (font-lock-variable-name-face ((t (:foreground "#74741b"))))
     (minibuffer-prompt ((t (:foreground "#729fcf" :bold t))))
     (font-lock-warning-face ((t (:foreground "red" :bold t))))
     )))

; (color-theme-hanabokuro)
; (color-theme-robin-hood)

(color-theme-emacs-21)

;; (el-get 'sync 'darkburn-theme)
;; (load "darkburn-theme")

;; (custom-set-faces
;;  ;; custom-set-faces was added by Custom.
;;  ;; If you edit it by hand, you could mess it up, so be careful.
;;  ;; Your init file should contain only one such instance.
;;  ;; If there is more than one, they won't work right.
;;  '(region ((t (:background "purple1")))))
