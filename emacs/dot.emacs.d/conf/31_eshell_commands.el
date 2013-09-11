;; 画面消去
(defun eshell/clear ()
  "Clear the current buffer, leaving one prompt at the top."
  (interactive)
  (let ((inhibit-read-only t))
    (erase-buffer)))

;; perldoc
(defun eshell/perldoc (&rest args)
      "Like `eshell/man', but invoke `perldoc'."
      (funcall 'perldoc (apply 'eshell-flatten-and-stringify args)))
(defun perldoc (man-args)
  (interactive "sPerldoc: ")
  (require 'man)
  (let ((manual-program "mperldoc"))
    (man man-args)))

;; info
(defun eshell/info (&optional subject)
  "Invoke `info', optionally opening the Info system to SUBJECT."
  (let ((buf (current-buffer)))
    (Info-directory)
    (if (not (null subject))
        (let ((node-exists (ignore-errors (Info-menu subject))))
          (if (not node-exists)
              (format "No menu item `%s' in node `(dir)Top'." subject))))))


;; magit
(defun eshell/magit ()
  "Invoke `magit-status'"
  (interactive)
  (call-interactively 'magit-status))
