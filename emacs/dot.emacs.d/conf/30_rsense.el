(el-get 'sync 'rsense-tool)

(require 'rsense)

(setq rsense-home (el-get-package-directory 'rsense-tool))

(add-hook 'ruby-mode-hook
          '(lambda ()
             (add-to-list 'ac-sources 'ac-source-rsense-method)
             (add-to-list 'ac-sources 'ac-source-rsense-constant)
))

; http://doc.ruby-lang.org/archives/201208/ruby-refm-1.9.3-dynamic-20120829.tar.gz
;(setq rsense-rurema-home ...)
;(setq rsense-rurema-refe ...)
