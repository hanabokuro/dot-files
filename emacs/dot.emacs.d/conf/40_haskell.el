(el-get 'sync 'haskell-mode)
(el-get 'sync 'ghc-mod)

(define-auto-insert "\\.hs\\'"
  '("Haskell Template"
    "{-# OPTIONS_GHC -Wall -Werror #-}\n\n"
    _))
