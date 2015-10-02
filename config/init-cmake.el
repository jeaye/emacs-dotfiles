(use-package cmake-font-lock
  :config
  (progn
    (add-hook 'cmake-mode-hook 'cmake-font-lock-activate)))
    
(provide 'init-cmake)
