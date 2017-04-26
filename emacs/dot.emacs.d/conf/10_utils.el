;; URL escape/unescape
(defun unescape (start end)
  (interactive "r")
  (let (src (ret "") s e)
    (setq src (buffer-substring-no-properties start end))
    (while (string-match "%[a-zA-Z0-9][a-zA-Z0-9]" src)
      (setq s (match-beginning 0))
      (setq e (match-end 0))
      (setq ret (concat ret (substring src 0 s)))
      (setq ret (concat ret (format "%c" (string-to-number (substring src (1+ s) e) 16))))
      (setq src (substring src e))
      )
    (setq ret (concat ret src))
    (insert-string "\n")
    (insert-string ret)
    )
  )

(defun escape (start end)
  (interactive "r")
  (insert-string "\n")
  (insert-string (escape-string (buffer-substring-no-properties start end))))

(defun escape-string (src)
  (let (_isascii _escape)
    (setq _isascii '(lambda (c)
          (cond
           ((and (<= ?A c)(<= c ?Z)) t)
           ((and (<= ?a c)(<= c ?z)) t)
           ((and (<= ?0 c)(<= c ?9)) t)
           (t nil))))
    (setq _escape '(lambda (l)
                     (cond
                      ((null l) nil)
                      (t (cons 
                          (if (funcall _isascii (car l)) (format "%c" (car l)) (format "%%%02x" (car l)))
                          (funcall _escape (cdr l))
                          )
                         ))))
    (eval (cons 'concat (funcall _escape (string-to-list src))))
))

(defun search-at-google ()
  (interactive)

  (let (keyword)
    (setq keyword (if (region-active-p)
                      (buffer-substring-no-properties (region-beginning) (region-end))
                    (or (thing-at-point 'symbol) (thing-at-point 'word) "")))
    (setq keyword (read-string (format "Search at google with [%s]" keyword) nil nil keyword))
    (browse-url (format "http://www.google.co.jp/search?q=%s" (escape-string keyword)))
))

(defun toggle-camelcase-and-snakecase ()
  (interactive)
 
  (let (start end bounds)
    (if (and transient-mark-mode mark-active)
        (progn
          (setq start (mark))
          (setq end   (point)))
      (let ((bounds (bounds-of-thing-at-point 'symbol)))
        (when bounds
          (setq start (car bounds))
          (setq end   (cdr bounds))))
      )
    (when (and start end) (toggle-camelcase-and-snakecase-innter (min start end) (max start end)))
    ))
 
(defun toggle-camelcase-and-snakecase-innter (start end)
  (save-excursion
    (save-restriction
      (setq case-fold-search nil)
      (narrow-to-region start end)
      (if (string-match "_" (buffer-substring start end))
          (progn ;; snake case => camel case
            (goto-char (point-min))
            (while (re-search-forward "_\\(.\\)" nil t)
              (replace-match (upcase (match-string 1)))))
        (progn ;; camel case => snake case
          (goto-char (point-min))
          (while (re-search-forward "\\([a-z]\\)\\([A-Z]\\)" nil t)
            (replace-match (concat (match-string 1) "_" (downcase (match-string 2))))))))))

(defun get-string-at-cursor ()
  (let (region begn end)
    (setq region (get-string-region-at-cursor))
    (if region
        (progn
          (setq beg (car region))
          (setq end (cadr region))
          (buffer-substring-no-properties beg end))
        nil)
    ))

(defun get-string-region-at-cursor ()
  (save-excursion
    (let (beg)
      (setq beg (nth 8 (parse-partial-sexp 1 (point))))
      (if beg
          (progn
            (goto-char beg)
            (forward-sexp)
            (list (1+ beg) (1- (point))))
        nil)
    )))

(defun insert-apidoc-comment ()
  (interactive)
  (save-excursion
    (let ((file-name (buffer-file-name))
          (current_line (buffer-substring (point-at-bol) (point-at-eol)))
          (method "get")
          path
          title
          name
          group
          api_name
          )
      (and
       (string-match "\\([^/]+\\)_controller\.php$" file-name)
       (setq group (substring file-name (match-beginning 1) (match-end 1)))
       (string-match "\\bpublic +function +\\([a-zA-Z0-9_]+\\)" current_line)
       (setq title (substring current_line (match-beginning 1) (match-end 1)))
       (progn
         (setq api_name (format "%s_%s_%s" method group title))
         (save-restriction
           (setq case-fold-search nil)
           (narrow-to-region (point) (point))
           (insert (capitalize api_name))
           (goto-char (point-min))
           (while (re-search-forward "_\\(.\\)" nil t)
             (replace-match (upcase (match-string 1))))
           (setq api_name (buffer-substring-no-properties (point-min) (point-max)))
           (delete-region (point-min)(point-max))
           )
         (beginning-of-line)
         (insert (concat "/**\n"
                         (format " * @api {%s} /%s/%s %s\n" method group title title)
                         (format " * @apiName %s\n" api_name)
                         (format " * @apiGroup %s\n" group)
                         " *\n"
                         " */\n"
         )))))))
