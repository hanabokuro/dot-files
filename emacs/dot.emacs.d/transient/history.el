((magit-branch nil)
 (magit-commit nil
               ("--allow-empty"))
 (magit-fetch nil)
 (magit-gitignore nil)
 (magit-log
  ("-n256" "--graph" "--color" "--decorate")
  ("-n512" "--graph" "--color" "--decorate")
  ("-n1024" "--grep=hot fix" "--graph" "--color" "--decorate")
  ("-n1024" "--grep=CrackingD" "--graph" "--color" "--decorate")
  ("-n128" "--graph" "--color" "--decorate")
  ("-n256" "--author=shigeki morimoto <shmorimo@shigeki-no-MacBook-Pro.local>" "--graph" "--color" "--decorate"))
 (magit-log:--grep "hot fix" "CrackingD")
 (magit-merge nil)
 (magit-pull nil)
 (magit-push nil
             ("--force-with-lease"))
 (magit-revert
  ("--edit"))
 (magit-stash nil)
 (magit:--author "shigeki morimoto <shmorimo@shigeki-no-MacBook-Pro.local>"))
