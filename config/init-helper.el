(defun add-to-hooks (hooks function)
  "Add a callback to multiple hooks.
   Example: (add-to-hooks '(c-mode-common-hook lisp-mode-hook) 'do-something)"
  (dolist (hook hooks)
    (add-hook hook function)))

(provide 'init-helper)
