; No backups
(setq backup-inhibited t)
(setq make-backup-files nil)
(setq auto-save-default nil)

; Save the cursor position for each file
(setq save-place-file "~/.emacs.saveplace")
(setq-default save-place t)
(require 'saveplace)

(defadvice save-buffers-kill-emacs (around no-query-kill-emacs activate)
  "Prevent annoying \"Active processes exist\" query when you quit Emacs."
  (cl-flet ((process-list ())) ad-do-it))

(provide 'init-save)
