(el-get 'sync 'inf-ruby)
(el-get 'sync 'ruby-mode)

(require 'inf-ruby)

(add-to-list 'inf-ruby-console-patterns-alist '("config/apps.rb" . padrino))

(defun inf-ruby-console-padrino (dir)
  "Run Padrino console in DIR."
  (interactive "D")
  (let ((default-directory dir))
    (run-ruby "bundle exec padrino console" "padrino")))

;;
;; Add them to ~/.hirb.yml to disable warning "WARNING: terminal is not fully functional"
;; ---
;; :pager: false
;;

