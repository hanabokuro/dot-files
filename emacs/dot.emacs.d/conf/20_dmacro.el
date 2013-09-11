(defconst *dmacro-key* "\C-o" "repeat key")
(global-set-key *dmacro-key* 'dmacro-exec)
(autoload 'dmacro-exec "dmacro" nil t)
