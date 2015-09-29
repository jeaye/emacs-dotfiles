(use-package helm
  :config
  (progn
    (require 'helm-locate)
    (helm-mode 1)

    (use-package helm-ls-git
      :config
      (progn
        (define-key evil-normal-state-map (kbd "C-p") 'helm-ls-git-ls)

        (define-key evil-normal-state-map
                    (kbd "C-S-p")
                    (lambda ()
                      (interactive)
                      (helm :sources '(helm-source-ls-git
                                       helm-source-locate)
                            :buffer "*helm-find-files*")))))))

(provide 'init-helm)
