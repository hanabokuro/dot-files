;; ================ magit ================
;;
;; M-x magit-status
;;
;;;;;;;;;;;;;;;; Branch ;;;;;;;;;;;;;;;;
;; b      open branch menu
;;
;;;;;;;;;;;;;;;; Status ;;;;;;;;;;;;;;;;
;; TAB    Toggle visibility of current section
;;
;; s      add untracked file to staging area
;; S      stage all
;; u      unstaged
;; U      unstaged all
;;
;; k      discard changes. Be carefull!
;;
;; c      prepare commit
;; C      prepare commit with ChangeLog style comment
;; C-cC-c Execute commit
;;
;; i      add file to .gitignore
;;
;;;;;;;;;;;;;;;; History ;;;;;;;;;;;;;;;;
;; l l    show repository history
;; l h    reflog
;;
;; v      revert !
;; C-w    copy sha1 signature
;; .      mark commit for range command
;; =      show diff with current commit and marked commit
;;
;;;;;;;;;;;;;;;; Diff ;;;;;;;;;;;;;;;;
;; d      show the changes with working tree and another revision.
;; D      show the changes between two revisions.
;;
;;;;;;;;;;;;;;;; Reset ;;;;;;;;;;;;;;;;
;; x      reset
;; X      reset --hard
;;
;;;;;;;;;;;;;;;; Stash ;;;;;;;;;;;;;;;;
;; z      create new stash
;; a      apply stash
;; k      delete stash
;;
;;;;;;;;;;;;;;;; Branch ;;;;;;;;;;;;;;;;
;; b      open branch menu
;; B      create new branch (short cut)
;;
;;;;;;;;;;;;;;;; Merging ;;;;;;;;;;;;;;;;
;; m      merge
;; e      magit-interactive-resolve-item (resolve conflict) => invoke ediff
;;    ediff:
;;       n, p => next/previosu diff
;;       a, b => choice left(a) or right(b)
;;       |    => vert/hoiz split
;;       q    => quit.  then type 'y' to save.
;;
;;;;;;;;;;;;;;;; Rebase ;;;;;;;;;;;;;;;;
;; R      rebase
;;
;;;;;;;;;;;;;;;; Pushing & Pulling ;;;;;;;;;;;;;;;;
;; P      push
;; C-u P  push to another remote repository
;; f      fetch
;; F      pull
;;
;;;;;;;;;;;;;;;; annoate ;;;;;;;;;;;;;;;;
;; C-x v g  vc-annotate
;; l               vc-annotate-show-log-revision-at-line
;;
;; n               vc-annotate-next-revision
;; p               vc-annotate-prev-revision
;;
;; RET             vc-annotate-goto-line
;; =               vc-annotate-show-diff-revision-at-line
;; d               vc-annotate-show-diff-revision-at-line
;; D               vc-annotate-show-changeset-diff-revision-at-line
;;
;; a               vc-annotate-revision-previous-to-line
;;
;; f               vc-annotate-find-revision-at-line
;; j               vc-annotate-revision-at-line
;; v               vc-annotate-toggle-annotation-visibility
;; w               vc-annotate-working-revision
;;
;;

(el-get 'sync 'magit)

(setq magit-log-header-end "-- End of Magit header --\n")
(add-to-list 'process-coding-system-alist '("git" . (euc-jp . euc-jp))); for v1.0

; (setq magit-diff-options '("--word-diff"))
; (setq magit-diff-options '("--word-diff" "--color-words"))

;; vi-git.el is too old. need modify to run git annotate.
(defun my-magit-mode-hook-function ()
  (defun vc-git-annotate-command (file buf &optional rev)
    ;; FIXME: rev is ignored
    (let ((name (file-relative-name file)))
      (vc-git-command buf 0 name "blame" rev)))
)
; (add-hook 'magit-mode-hook 'my-magit-mode-hook-function)

(defun my-magit-reset-process ()
  (interactive)
  (and magit-process (process-kill-without-query magit-process))
  (and (get-buffer magit-process-buffer-name)
       (kill-buffer (get-buffer magit-process-buffer-name)))
  (setq magit-process nil)
)
