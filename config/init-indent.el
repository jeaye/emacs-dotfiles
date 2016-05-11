; Use spaces instead of tabs
(setq-default default-tab-width 2
              indent-tabs-mode nil)

(global-visual-line-mode)

; C++ indent style
(setq c-default-style "bsd"
      c-basic-offset 2)

; Color the gutter
(add-hook 'after-change-major-mode-hook 'fci-mode)

(provide 'init-indent)
