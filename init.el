(setq user-full-name "jeaye")
(setq user-mail-address "contact@jeaye.com")

(add-to-list 'load-path (expand-file-name "config" user-emacs-directory))
(require 'init-after)
(require 'init-package)
(require 'init-evil)
(require 'init-color)
(require 'init-indent)
(require 'init-lisp)
(require 'init-font)
(require 'init-save)
(require 'init-gui)
(require 'init-gdb)
(require 'init-powerline)
(require 'init-helm)

; TODO
; magit
; helm (proper ctrlp functionality)
; completion (emacs-ycmd, company-ycmd)
; org mode

(provide 'init)
