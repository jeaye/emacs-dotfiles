; Use spaces instead of tabs
(setq-default default-tab-width 2
              indent-tabs-mode nil)

; Indent after pressing return
(define-key global-map (kbd "RET") 'newline-and-indent)

(global-visual-line-mode)

; Color the gutter
(use-package fill-column-indicator
  :config
  (progn
    (setq fci-rule-column 80)
    (define-globalized-minor-mode global-fci-mode
                                  fci-mode
                                  (lambda () (fci-mode 1)))
    (global-fci-mode 1)))

(provide 'init-indent)
