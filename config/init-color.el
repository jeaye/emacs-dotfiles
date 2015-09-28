;; Solarized
(require-package 'color-theme-sanityinc-solarized)
(require 'color-theme-sanityinc-solarized)
(color-theme-sanityinc-solarized--define-theme dark)

; Allow colors to work better in the terminal
;(color-theme-approximate-on)

; Colorize delimiters
(require-package 'rainbow-delimiters)
(add-hook 'prog-mode-hook 'rainbow-delimiters-mode)

(provide 'init-color)
