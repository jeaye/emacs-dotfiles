; No backups
(setq make-backup-files nil)

; Save the cursor position for each file
(setq save-place-file "~/.emacs.d/saveplace")
(setq-default save-place t)
(require 'saveplace)

(provide 'init-save)
