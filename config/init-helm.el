(use-package helm
  :config
  (progn
    (require 'helm-locate)
    (helm-mode 1)

    (use-package helm-projectile
      :config
      (progn
        (projectile-global-mode)
        (setq projectile-completion-system 'helm)
        (helm-projectile-on)
        (setq projectile-enable-caching t)
        (define-key evil-normal-state-map
                    (kbd "C-p")
                    'projectile-find-file)))))

(provide 'init-helm)
