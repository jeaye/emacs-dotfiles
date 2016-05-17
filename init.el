(setq user-full-name "jeaye")
(setq user-mail-address "contact@jeaye.com")

;(add-to-list 'load-path (expand-file-name "config" user-emacs-directory))
(add-to-list 'load-path (expand-file-name "~/projects/emacs-dotfiles/config"))
(require 'init-indent)
(require 'init-save)

(provide 'init)
