(require 'eshell)
(custom-set-variables
 ;; 補完時に大文字小文字を区別しない
;; '(eshell-cmpl-ignore-case t)   ;; ~/ の補完時に Text is read-only になってしまう...   http://lists.gnu.org/archive/html/bug-gnu-emacs/2012-11/msg00343.html
 ;; 補完時にサイクルしない
 '(eshell-cmpl-cycle-completions nil)
 ;; 履歴で重複を無視する
 '(eshell-hist-ignoredups t)
 '(eshell-ask-to-save-history (quote always))
 '(eshell-history-size 1000)
 '(eshell-ls-exclude-regexp "~\\'")
 '(eshell-ls-initial-args "-h")
;; '(eshell-ls-use-in-dired t nil (em-ls))
;; '(eshell-ls-dired-initial-args (quote ("-h")))
 '(eshell-modules-list (quote
                        (
                         ;; alias 機能
                         eshell-alias
                         ;; echo, umask, version コマンド
                         eshell-basic
                         ;; context-sensitive な completion機能. コマンドの引数をいい感じにcompletionさせたりできる
                         eshell-cmpl
                         ;; cd =     : 訪問済みディレクトリのlist表示
                         ;; cd -4    : 4/番目に移動
                         ;; cd =foo  : fooを含む訪問済みディレクトリに移動
                         eshell-dirs
                         ;; The globbing code used by Eshell closely follows the syntax used by
                         ;; zsh.  Basically, here is a summary of examples:
                         ;;
                         ;;   echo a*       ; anything starting with 'a'
                         ;;   echo a#b      ; zero or more 'a's, then 'b'
                         ;;   echo a##b     ; one or more 'a's, then 'b'
                         ;;   echo a?       ; a followed by any character
                         ;;   echo a*~ab    ; 'a', then anything, but not 'ab'
                         ;;   echo c*~*~    ; all files beginning with 'c', except backups (*~)
                         ;;
                         ;; Recursive globbing is also supported:
                         ;;
                         ;;   echo **/*.c   ; all '.c' files at or under current directory
                         ;;   echo ***/*.c  ; same as above, but traverse symbolic links
                         eshell-glob
                         ;; Eshell's history facility imitates the syntax used by bash
                         ;; ([(bash)History Interaction]).  Thus:
                         ;;
                         ;;   !ls           ; repeat the last command beginning with 'ls'
                         ;;   !?ls          ; repeat the last command containing ls
                         ;;   echo !ls:2    ; echo the second arg of the last 'ls' command
                         ;;   !ls<tab>      ; complete against all possible words in this
                         ;;                 ; position, by looking at the history list
                         ;;   !ls<C-c SPC>  ; expand any matching history input at point
                         ;;
                         ;; Also, most of `comint-mode's keybindings are accepted:
                         ;;
                         ;;   M-r     ; search backward for a previous command by regexp
                         ;;   M-s     ; search forward for a previous command by regexp
                         ;;   M-p     ; access the last command entered, repeatable
                         ;;   M-n     ; access the first command entered, repeatable
                         ;;
                         ;;   C-c M-r ; using current input, find a matching command thus, with
                         ;;           ; 'ls' as the current input, it will go back to the same
                         ;;           ; command that '!ls' would have selected
                         ;;   C-c M-s ; same, but in reverse order
                         eshell-hist
                         ;; ls command
                         eshell-ls
                         ;; Argument predication is used to affect which members of a list are
                         ;; selected for use as argument.  This is most useful with globbing,
                         ;; but can be used on any list argument, to select certain members.
                         ;;
                         ;; Argument modifiers are used to manipulate argument values.  For
                         ;; example, sorting lists, upcasing words, substituting characters,
                         ;; etc.
                         ;;
                         ;; Here are some examples of how to use argument predication.  Most of
                         ;; the predicates and modifiers are modeled after those provided by
                         ;; zsh.
                         ;;
                         ;;   ls -ld *(/)           ; list all directories
                         ;;   ls -l *(@u'johnw')    ; list all symlinks owned by 'johnw'
                         ;;   bzip2 -9v **/*(a+30)  ; compress everything which hasn't been
                         ;;                           accessed in 30 days
                         ;;   echo *.c(:o:R)     ; a reversed, sorted list of C files
                         ;;   *(^@:U^u0)         ; all non-symlinks not owned by 'root', upcased
                         ;;   chmod u-x *(U*)    : remove exec bit on all executables owned by user
                         eshell-pred
                         ;; prompt らしい。
                         eshell-prompt
                         ;; キーバインドをいろいろ置き換え terminal での操作と同じにする
                         ;; C-p C-n でshell history操作になったりする
                         eshell-rebind
                         ;; script らしい。
                         eshell-script
                         ;; コマンドの編集/再実行が簡単になる
                         ;; 新規コマンドの場合も簡単に。
;;;;;                         eshell-smart
                         ;; vi や lynx のために term.el をいい感じに起動する
                         eshell-term
                         ;; unixの基本的なコマンド(grep, rm, cp, mv など)が無い場合にエミュレーションする
                         eshell-unix
                         ;; eshell の alias集
                         ;; 独自拡張する場合のサンプルとしても使用できる
                         eshell-xtra
                         )))

 ;; t を 't' として表示する
 '(eshell-stringify-t nil)
 ;; 以下のコマンドは eshell-term で terminal-mode を有効にする
 '(eshell-visual-commands (quote ("vi" "vim" "top" "screen" "less" "lynx" "ssh" "rlogin" "telnet")))
 ;; eshell時の TERM
 '(eshell-term-name "ansi")
)

;; C-a でコマンド行頭に移動
;; すでにコマンド行頭にいる場合は、プロンプトを越えて行の先頭に移動
(defun eshell-maybe-bol ()
  (interactive)
  (let ((p (point)))
    (eshell-bol)
    (if (= p (point))
        (beginning-of-line))))
(setq eshell-rebind-keys-alist
  '(([(control ?a)] . eshell-maybe-bol)
    ([home]         . eshell-maybe-bol)
    ([(control ?d)] . eshell-delchar-or-maybe-eof)
    ([backspace]    . eshell-delete-backward-char)
    ([delete]       . eshell-delete-backward-char)
    ([(control ?w)] . backward-kill-word)
    ([(control ?u)] . eshell-kill-input)))

;; prompt文字列の変更
(autoload 'vc-git-working-revision "vc-git" nil t)
(setq eshell-prompt-function
      (lambda ()
        (let ((git-branch (vc-git-working-revision (eshell/pwd))))
          (concat
           ;; username & hostname
           "[" (getenv "USER") "@" (car (split-string system-name "[.]"))
           ;; ディレクトリが3階層よりも深い場合は、先頭の1文字に省略する
           " " ((lambda (p-lst)
                  (if (> (length p-lst) 3)
                      (concat
                       (mapconcat (lambda (elm) (if (string= elm "") "" (substring elm 0 1)))
                                  (butlast p-lst (- (length p-lst) 3))
                                  "/")
                       "/"
                       (mapconcat (lambda (elm) elm)
                                  (last p-lst (- (length p-lst) 3))
                                  "/"))
                    (mapconcat (lambda (elm) elm) p-lst "/")))
                (split-string (eshell/pwd) "/"))
           ;; git branch名の表示
           (if (= 0 (length git-branch)) "" (concat " (" git-branch ")"))
           "] $ "))))

;; ls の結果を RET or mouse click で開けるようにする
;; http://www.emacswiki.org/cgi-bin/wiki/EshellEnhancedLS
(eval-after-load "em-ls"
  '(progn
     (defun ted-eshell-ls-find-file-at-point (point)
       "RET on Eshell's `ls' output to open files."
       (interactive "d")
       (find-file (buffer-substring-no-properties
                   (previous-single-property-change point 'help-echo)
                   (next-single-property-change point 'help-echo))))

     (defun pat-eshell-ls-find-file-at-mouse-click (event)
       "Middle click on Eshell's `ls' output to open files.
 From Patrick Anderson via the wiki."
       (interactive "e")
       (ted-eshell-ls-find-file-at-point (posn-point (event-end event))))

     (let ((map (make-sparse-keymap)))
       (define-key map (kbd "RET")      'ted-eshell-ls-find-file-at-point)
       (define-key map (kbd "<return>") 'ted-eshell-ls-find-file-at-point)
       (define-key map (kbd "<mouse-2>") 'pat-eshell-ls-find-file-at-mouse-click)
       (defvar ted-eshell-ls-keymap map))

     (defadvice eshell-ls-decorated-name (after ted-electrify-ls activate)
       "Eshell's `ls' now lets you click or RET on file names to open them."
       (add-text-properties 0 (length ad-return-value)
                            (list 'help-echo "RET, mouse-2: visit this file"
                                  'mouse-face 'highlight
                                  'keymap ted-eshell-ls-keymap)
                            ad-return-value)
       ad-return-value)))
