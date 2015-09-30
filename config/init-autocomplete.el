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
    (setq company-backends (delete 'company-clang company-backends))
    (setq company-idle-delay 0)
    (global-company-mode)
    (company-ycmd-setup)

    ; Company + fci is fucked
    ; https://github.com/company-mode/company-mode/issues/180
    (defvar-local company-fci-mode-on-p nil)
    (defun company-turn-off-fci (&rest ignore)
      (when (boundp 'fci-mode)
        (setq company-fci-mode-on-p fci-mode)
        (when fci-mode (fci-mode -1))))
    (defun company-maybe-turn-on-fci (&rest ignore)
      (when company-fci-mode-on-p (fci-mode 1)))
    (add-hook 'company-completion-started-hook 'company-turn-off-fci)
    (add-hook 'company-completion-finished-hook 'company-maybe-turn-on-fci)
    (add-hook 'company-completion-cancelled-hook 'company-maybe-turn-on-fci)))

(use-package flycheck-ycmd
  :config
  (progn
    (flycheck-ycmd-setup)
    (global-flycheck-mode)))

(provide 'init-autocomplete)
