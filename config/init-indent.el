; Use spaces instead of tabs
(setq-default tab-width 2 indent-tabs-mode nil)

; Indent after pressing return
(define-key global-map (kbd "RET") 'newline-and-indent)

; Color the gutter
;(require 'column-marker)
;(add-hook 'text-mode-hook (lambda () (interactive) (column-marker-1 80)))
(require 'fill-column-indicator)
(define-globalized-minor-mode global-fci-mode fci-mode (lambda () (fci-mode 1)))
(global-fci-mode 1)

(provide 'init-indent)
