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
;;;;;;;;;;;;;;;; remote ;;;;;;;;;;;;;;;;
;; M        popup remote menu
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

(use-package magit
  :ensure t
  :bind (("C-&" . magit-status)) ; 以前のキーバインドを継承
  :config
  ;; --- コーディングシステムの設定 ---
  (add-to-list 'process-coding-system-alist '("git" . (utf-8 . utf-8)))

  ;; --- フェッチ・トラッキングの設定 ---
  ;; --prune をデフォルトにする（以前の設定を継承）
  (setq magit-fetch-arguments '("--prune"))
  ;; トラッキング名をブランチ名のみにする
  (setq magit-default-tracking-name-function #'magit-default-tracking-name-branch-only)

  ;; --- プロセスのリセット（現代版） ---
  ;; 以前の my-magit-reset-process に相当する機能は magit-process-kill で可能です
  (defun my/magit-soft-reset ()
    (interactive)
    (when (get-buffer magit-process-buffer-name)
      (magit-process-kill)
      (message "Magit process killed."))))
