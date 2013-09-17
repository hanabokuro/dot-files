;; compatibility hack
(defun make-local-hook (dummy))

;; OSを判別
(defvar run-linux (equal system-type 'gnu/linux))

;; Windowシステムを判別
(defvar run-cli (equal window-system nil))
(defvar run-x11 (equal window-system 'x))

(if run-x11
    (custom-set-faces
     ;; custom-set-faces was added by Custom.
     ;; If you edit it by hand, you could mess it up, so be careful.
     ;; Your init file should contain only one such instance.
     ;; If there is more than one, they won't work right.
     '(default ((t (:family "Nimbus Mono L" :foundry "urw" :slant normal :weight normal :height 144 :width normal)))))
)

;; PATH をshellから取得して設定する
(defun set-exec-path-from-shell-PATH ()
  "Set up Emacs' `exec-path' and PATH environment variable to match that used by the user's shell.

This is particularly useful under Mac OSX, where GUI apps are not started from a shell."
  (interactive)
  (let ((path-from-shell (replace-regexp-in-string "[ \t\n]*$" "" (shell-command-to-string "$SHELL --login -c 'echo $PATH'"))))
    (setenv "PATH" path-from-shell)
    (setq exec-path (split-string path-from-shell path-separator))))
(set-exec-path-from-shell-PATH)
