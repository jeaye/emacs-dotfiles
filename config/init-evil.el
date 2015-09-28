;; Evil Mode

; Allow using C-u and C-d for scrolling
;(setq evil-want-C-u-scroll t)

(require 'evil)
(evil-mode 1)

; Setup , as a leader
(require 'evil-leader)
(global-evil-leader-mode)
(setq evil-leader/in-all-states 1)
(evil-leader/set-leader ",")

; ,x to be M-x
(evil-leader/set-key "x" 'execute-extended-command)

; Allow escaping of lots of things
(evil-escape-mode)
(global-set-key (kbd "C-[") 'evil-escape)

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

(provide 'init-evil)
