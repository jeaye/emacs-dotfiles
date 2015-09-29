(require-package 'helm)
(require-package 'helm-ls-git)
(require 'helm-locate)
(require 'helm-ls-git)

(helm-mode 1)

(define-key evil-normal-state-map (kbd "C-p") 'helm-ls-git-ls)

(define-key evil-normal-state-map
            (kbd "C-S-p")
            (lambda ()
              (interactive)
              (helm :sources '(helm-source-ls-git
                               helm-source-locate)
                    :buffer "*helm-find-files*")))

(provide 'init-helm)
