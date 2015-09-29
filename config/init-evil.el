;; Evil Mode

(use-package evil
  :config
  (progn
    (evil-mode 1)

    ; Color cursor based on mode
    (setq evil-emacs-state-cursor '("red" box))
    (setq evil-normal-state-cursor '("green" box))
    (setq evil-visual-state-cursor '("orange" box))
    (setq evil-insert-state-cursor '("red" bar))
    (setq evil-replace-state-cursor '("red" bar))
    (setq evil-operator-state-cursor '("red" hollow))

    ; Use C-j and C-k for Vim's C-d and C-u
    (define-key evil-normal-state-map (kbd "C-k") (lambda ()
                                                    (interactive)
                                                    (evil-scroll-up nil)))
    (define-key evil-normal-state-map (kbd "C-j") (lambda ()
                                                    (interactive)
                                                    (evil-scroll-down nil)))

    ; C-w to delete words
    (define-key minibuffer-local-map (kbd "C-w") #'backward-kill-word)

    ; j and k move the visual line in long wrapped lines
    (define-key evil-normal-state-map (kbd "j") 'evil-next-visual-line)
    (define-key evil-normal-state-map (kbd "k") 'evil-previous-visual-line)))

; Setup , as a leader
(use-package evil-leader
  :config
  (progn
    (global-evil-leader-mode)
    (setq evil-leader/in-all-states 1)
    (evil-leader/set-leader ","))

    ; ,x to be M-x
    (evil-leader/set-key "x" 'execute-extended-command))

; Allow escaping of lots of things
(use-package evil-escape
  :config
  (progn
    (evil-escape-mode)
    (global-set-key (kbd "<escape>") 'evil-escape)))

; Various tag matching
(use-package evil-matchit)

; C-+ C-- to increase/decrease number like Vim's C-a C-x
(use-package evil-numbers
  :config
  (progn
    (define-key evil-normal-state-map (kbd "C-=") 'evil-numbers/inc-at-pt)
    (define-key evil-normal-state-map (kbd "C--") 'evil-numbers/dec-at-pt)))

; Surround
(use-package evil-surround
  :load-path "packages/evil-surround"
  :config
  (progn
    (global-evil-surround-mode 1)))

(provide 'init-evil)
