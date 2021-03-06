(el-get 'sync 'ruby-mode)
(add-to-list 'auto-mode-alist '("\\.rake$" . ruby-mode))

(add-to-list 'auto-mode-alist '("\\.rake$" . ruby-mode))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(el-get 'sync 'inf-ruby)
(require 'inf-ruby)

(add-to-list 'inf-ruby-console-patterns-alist '("config/apps.rb" . padrino))

(defun inf-ruby-console-padrino (dir)
  "Run Padrino console in DIR."
  (interactive "D")
  (let ((default-directory dir))
    (run-ruby "bundle exec padrino console" "padrino")))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(el-get 'sync 'ruby-block)
(require 'ruby-block)
(ruby-block-mode t)
(setq ruby-block-highlight-toggle t)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; (el-get 'sync 'ruby-electric)  ; use smartparens
; (require 'ruby-electric)       ; use smartparens
(add-hook 'ruby-mode-hook '(lambda ()
;                             (ruby-electric-mode t) ; use smartparens
                             (define-key ruby-mode-map " " 'mlh-space-bar-backward-henkan)
                             ))

(defun mlhruby ()
  (interactive)
  (define-key ruby-mode-map " " 'mlh-space-bar-backward-henkan))


;;
;; Add them to ~/.hirb.yml to disable warning "WARNING: terminal is not fully functional"
;; ---
;; :pager: false
;;

