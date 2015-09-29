;; Solarized
(use-package color-theme-sanityinc-solarized
  :config
  (progn
    (color-theme-sanityinc-solarized--define-theme dark)))

; Colorize delimiters
(use-package rainbow-delimiters
  :config
  (progn
    (add-hook 'prog-mode-hook 'rainbow-delimiters-mode)))

(provide 'init-color)
