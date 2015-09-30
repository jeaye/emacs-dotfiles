(use-package ycmd
  :config
  (progn
    (global-ycmd-mode)
    (set-variable 'ycmd-server-command
                  '("python" "/home/jeaye/.emacs.d/packages/ycmd/ycmd/"))
    (set-variable 'ycmd-extra-conf-whitelist '("~/projects/*"))
    (setq ycmd-extra-conf-handler 'load)))

(use-package company-ycmd
  :config
  (progn
    (company-ycmd-setup)
    (setq company-backends (delete 'company-clang company-backends))
    (global-company-mode)))

(use-package flycheck-ycmd
  :config
  (progn
    (flycheck-ycmd-setup)
    (global-flycheck-mode)))

(provide 'init-autocomplete)
