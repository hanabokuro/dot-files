;; http://d.hatena.ne.jp/kiwanami/20121216/1355706256

(defvar swap-quotes-list
  '((?\" ?\') (?\' ?\`) (?\` ?\")))

(defun transpose-chars-or-swap-quotes (arg)
  (interactive "p")
  (or (swap-quotes) (transpose-chars nil)))

(defun swap-quotes ()
  (interactive)
  (catch 'break
    (dolist (i swap-quotes-list)
      (let ((target-char (car i))
            (replaced-char (cadr i))
            (prev-pos (point)))
        (if (and (< (point) (point-max)) (= (char-after (point)) target-char))
            (save-excursion
              (forward-char 1)
              (let ((next-pos (re-search-forward (char-to-string target-char))))
                (if next-pos
                    (subst-char-in-region prev-pos next-pos target-char replaced-char)
                  (message "The corresponding quote is not found.")))
              (throw 'break t)))))
    nil))

(global-set-key (kbd "C-t") 'transpose-chars-or-swap-quotes)
