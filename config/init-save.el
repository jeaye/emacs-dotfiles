; No backups
(setq make-backup-files nil)

; Save the cursor position for each file
(setq save-place-file "~/.emacs.d/saveplace")
(setq-default save-place t)
(require 'saveplace)

(defadvice save-buffers-kill-emacs (around no-query-kill-emacs activate)
  "Prevent annoying \"Active processes exist\" query when you quit Emacs."
  (flet ((process-list ())) ad-do-it))

(provide 'init-save)
