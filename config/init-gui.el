; Disable GUI elements
(set-fringe-mode -1)
(scroll-bar-mode -1)
(tool-bar-mode -1)

; No bell
(custom-set-variables '(ring-bell-function 'ignore))
(setq visible-bell nil)

; Smooth scrolling
(setq scroll-margin 5
      scroll-conservatively 9999
      scroll-step 1)

; y or n is enough
(defalias 'yes-or-no-p 'y-or-n-p)

; Clean scratch buffer
(setq initial-scratch-message nil)
(setq inhibit-startup-screen t)

(set-mouse-color "#ffffff")

; Line numbers
(global-linum-mode t)

; Highlight source code identifiers
(add-to-hooks '(c-mode-common-hook
                lisp-mode-hook
                emacs-lisp-mode-hook)
              (lambda ()
                (font-lock-add-keywords nil
                                        '(("\\<\\(FIXME\\|TODO\\|BUG\\|XXX\\)"
                                           1
                                           font-lock-warning-face
                                           t)))))

(provide 'init-gui)
