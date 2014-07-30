; run 'brew install markdown' for preview

; C-c C-c p    preview

;; link
; C-c C-a l    insert an inline link
; C-c C-a L    insert a reference link
; C-c C-a u    insert a bare link
; C-c C-a f    insert a footnote marker
; C-c C-a w    insert a wiki marker

;; image
; C-c C-i i    insert markup for an inline image

;; style
; C-c C-s e    <em>
; C-c C-s s    <strong>
; C-c C-s c    <code>
; C-c C-s b    <blockquote>
; C-c C-s p    <pre>

;; heading
; C-c C-t h    insert a heading with automatically chosen type and level.  C-u prefix can be given level.
; C-c C-t 1    insert a heading of a specific level
; C-c C-t 2
;      .
;      .
; C-c C-t 6

;; Horizontal rule
; C-c -    insert a horizontale rule

;; Markdown and Maintenance Commands
; C-c C-c m    comple and show. `markdown-command' > `*markdown-output*` buffer.
; C-c C-c p    preview.  `markdown-command' > temporary file > browser.
; C-c C-c e    comple to .html. `markdown-command' > `basename.html`.
; C-c C-c v    comple to html and show. `markdown-command' > `basename.html` > browser.
; C-c C-c w    comple to buffer. `markdown-command' > kill ring.

; C-c C-c c    check for undefined references.
; C-c C-c n    renumber any orderd list
; C-c C-c ]    complete all heading and normalizes all horizontal rules

; C-c C--    demote
; C-c C-=    promote

;; Editing list
; M-RET    insert new list item
; M-UP M-DOWN  move up or down existing list item

;; Outline Navigation
; C-c C-n    move to next visible heading
; C-c C-p    move to previous visible heading
; C-c C-b    move to next visible same level heading
; C-c C-f    move to previous visible same level heading

(el-get 'sync 'markdown-mode)

(add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))
