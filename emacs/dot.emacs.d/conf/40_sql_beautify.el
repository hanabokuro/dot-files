(defun run-sqlbeautify (is_convert_to_multi_lines)
  (interactive
   (list (y-or-n-p "convert to multi lines ?")))
  (save-excursion
    (let (beg end region)
      (cond ((use-region-p)
             (progn
               (setq beg (region-beginning))
               (setq end (region-end))
               ))
            ((setq region (get-string-region-at-cursor))
             (progn
               (setq beg (car region))
               (setq end (cadr region))
               ))
            )
      (narrow-to-region beg end)
      (let ((spaces 4) (break "\\n") command (offset 0))
        (and is_convert_to_multi_lines (setq offset (read-number "offset: " 0)))
        (or is_convert_to_multi_lines (progn (setq spaces 0) (setq break " ")))
        (setq command (format "perl -MSQL::Beautify -e 'print SQL::Beautify->new('query'=>join(\"\",<>),'uc_keywords'=>1, 'spaces'=>%d, 'break' => \"%s\")->beautify';"
                            spaces break))
        (shell-command-on-region (point-min) (point-max) command nil t)
        (replace-regexp "^"  (make-string offset ? ) nil (point-min) (point-max))
        )
      (widen)
      )))
