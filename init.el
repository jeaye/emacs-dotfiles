(setq user-full-name "jeaye")
(setq user-mail-address "contact@jeaye.com")

;(add-to-list 'load-path (expand-file-name "config" user-emacs-directory))
(add-to-list 'load-path (expand-file-name "~/projects/emacs-dotfiles/config"))
;;;(require 'init-helper)
;;;(require 'init-package)
;;;(require 'init-evil)
;;;(require 'init-color)
(require 'init-indent)
;;;(require 'init-lisp)
;;;(require 'init-font)
(require 'init-save)
;;;(require 'init-gui)
;;;(require 'init-gdb)
;;;(require 'init-powerline)
;;;(require 'init-helm)
;;;(require 'init-slime)
;;;(require 'init-autocomplete)
;;;(require 'init-cmake)
;;;(require 'init-markdown)

; TODO
; magit
; helm - open in new tab
; org mode
; diminish
; move tabs
; unicode input like vim
; :e from PWD, not the current buffer

(provide 'init)
