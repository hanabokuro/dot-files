(add-to-list 'my-helm-source-list-for-helm-other-buffer
             '((name . "Calculation Result")
               (dummy)
               (type . 'string)
               (filtered-candidate-transformer . (lambda (candidates source)
                                                   (list
                                                    (condition-case nil
                                                        (with-helm-current-buffer (calc-eval helm-pattern))
                                                      (error "Error")))))
               (action . (("Copy result to kill-ring" . kill-new)))
               )
             :append)
