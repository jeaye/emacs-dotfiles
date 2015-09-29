(use-package powerline
  :config
  (progn
    (add-to-list 'load-path "~/.emacs.d/packages/powerline-evil")
    (require 'powerline-evil)
    (powerline-evil-vim-color-theme)))

(provide 'init-powerline)
