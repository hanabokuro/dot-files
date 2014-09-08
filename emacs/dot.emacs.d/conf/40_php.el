(el-get 'sync 'php-mode)

(el-get 'sync 'flymake-php)
(add-hook 'php-mode-hook 'flymake-php-load)

(el-get 'sync 'php-completion)

(add-hook 'php-mode-hook
          (lambda ()
            (defun ywb-php-lineup-arglist-intro (langelem)
              (save-excursion
                (goto-char (cdr langelem))
                (vector (+ (current-column) c-basic-offset))))
            (defun ywb-php-lineup-arglist-close (langelem)
              (save-excursion
                (goto-char (cdr langelem))
                (vector (current-column))))
            (c-set-style "stroustrup")    ; インデントは4文字分基本スタイル
            (c-set-offset 'arglist-intro 'ywb-php-lineup-arglist-intro) ; 配列のインデント関係
            (c-set-offset 'arglist-close 'ywb-php-lineup-arglist-close) ; 配列のインデント関係
            (c-set-offset 'arglist-cont-nonempty' 4) ; 配列のインデント関係
            (c-set-offset 'case-label' 4) ; case はインデントする
            (make-local-variable 'tab-width)
            (make-local-variable 'indent-tabs-mode)
            (setq tab-width 4)
            (setq indent-tabs-mode nil)))   ; インデントはスペースを使う


(add-hook 'php-mode-hook
          (lambda ()
            (provide 'anything)
            (provide 'anything-match-plugin)
            (require 'php-completion)
            (php-completion-mode t)))

(add-hook 'php-mode-hook
          (lambda ()
            (make-local-variable 'ac-sources)
            (setq ac-sources '(
                               ac-source-words-in-same-mode-buffers
                               ac-source-php-completion
                               ac-source-filename
                               ac-source-abbrev
; ac-source-yasnippet
; ac-source-gtags
; ac-source-etags
                               ))))

(defun run-php-cs-fixer ()
  (interactive)
  (shell-command (concat "php-cs-fixer fix " (buffer-file-name) " --level=psr2"))
  (revert-buffer nil t))

(add-hook 'php-mode-hook
          (lambda ()
            (add-hook 'after-save-hook 'run-php-cs-fixer nil 'make-it-local)))
