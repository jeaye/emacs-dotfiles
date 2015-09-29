(use-package powerline
  :config
  (progn
    (use-package powerline-evil
      :load-path "packages/powerline-evil"
      :config
      (progn
        (powerline-evil-vim-color-theme)))))

(provide 'init-powerline)
