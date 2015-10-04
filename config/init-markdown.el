(use-package markdown-mode
  :config
  (progn
    (add-hook 'gfm-mode-hook 'visual-line-mode)
    (add-to-list 'auto-mode-alist '("\\.markdown\\'" . markdown-mode))
    (add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))))

(provide 'init-markdown)
