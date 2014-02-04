(el-get 'sync 'ruby-mode)

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

(el-get 'sync 'ruby-electric)
(require 'ruby-electric)
(add-hook 'ruby-mode-hook '(lambda () (ruby-electric-mode t)))


;;
;; Add them to ~/.hirb.yml to disable warning "WARNING: terminal is not fully functional"
;; ---
;; :pager: false
;;

