;;; packages.el --- tabbar Layer packages File for Spacemacs
;;
;; Copyright (c) 2012-2014 Sylvain Benner
;; Copyright (c) 2014-2015 Sylvain Benner & Contributors
;;
;; Author: Sylvain Benner <sylvain.benner@gmail.com>
;; URL: https://github.com/syl20bnr/spacemacs
;;
;; This file is not part of GNU Emacs.
;;
;;; License: GPLv3

(defvar tabbar-packages
  '(tabbar)
  "List of all packages to install and/or initialize. Built-in packages
which require an initialization must be listed explicitly in the list.")

(defvar tabbar-excluded-packages '()
  "List of packages to exclude.")

;; For each package, define a function tabbar/init-<package-tabbar>
;;
;; (defun tabbar/init-my-package ()
;;   "Initialize my package"
;;   )
;;
;; Often the body of an initialize function uses `use-package'
;; For more info on `use-package', see readme:
;; https://github.com/jwiegley/use-package
(defun tabbar/init-tabbar ()
  "Initialize tabbar"
  (use-package tabbar
    :defer t
    :init
    (progn
      (tabbar-mode)

      (defvar evil-tabbar-map (make-sparse-keymap)
        "Keymap for tabbar-related commands.")

      (define-key evil-motion-state-map (kbd "C-e") 'evil-tabbar-map)

      (define-prefix-command 'evil-tabbar-map)
      (define-key evil-tabbar-map "h" 'tabbar-backward-tab)
      (define-key evil-tabbar-map "j" 'tabbar-forward)
      (define-key evil-tabbar-map "k" 'tabbar-backward)
      (define-key evil-tabbar-map "l" 'tabbar-forward-tab)
      (define-key evil-tabbar-map (kbd "C-h") 'tabbar-backward-tab)
      (define-key evil-tabbar-map (kbd "C-j") 'tabbar-forward)
      (define-key evil-tabbar-map (kbd "C-k") 'tabbar-backward)
      (define-key evil-tabbar-map (kbd "C-l") 'tabbar-forward-tab)

      ;; Add a buffer modification state indicator in the tab label, and place a
      ;; space around the label to make it looks less crowd.
      (defadvice tabbar-buffer-tab-label (after fixup_tab_label_space_and_flag activate)
        (setq ad-return-value
              (if (and (buffer-modified-p (tabbar-tab-value tab))
                       (buffer-file-name (tabbar-tab-value tab)))
                  (concat " + " (concat ad-return-value " "))
                (concat " " (concat ad-return-value " ")))))

      ;; Called each time the modification state of the buffer changed.
      (defun ztl-modification-state-change ()
        (tabbar-set-template tabbar-current-tabset nil)
        (tabbar-display-update))

      ;; First-change-hook is called BEFORE the change is made.
      (defun ztl-on-buffer-modification ()
        (set-buffer-modified-p t)
        (ztl-modification-state-change))
      (add-hook 'after-save-hook 'ztl-modification-state-change)

      ;; This doesn't work for revert, I don't know.
      ;;(add-hook 'after-revert-hook 'ztl-modification-state-change)
      (add-hook 'first-change-hook 'ztl-on-buffer-modification)

      (defun tabbar-add-tab (tabset object &optional append_ignored)
        "Add to TABSET a tab with value OBJECT if there isn't one there yet.
If the tab is added, it is added at the beginning of the tab list,
unless the optional argument APPEND is non-nil, in which case it is
added at the end."
        (let ((tabs (tabbar-tabs tabset)))
          (if (tabbar-get-tab object tabset)
              tabs
            (let ((tab (tabbar-make-tab object tabset)))
              (tabbar-set-template tabset nil)
              (set tabset (sort (cons tab tabs)
                                (lambda (a b) (string< (buffer-name (car a)) (buffer-name (car b))))))))))

      ; TODO: Remove arrows?
      (set-face-attribute
       'tabbar-default nil
       :background "#002b36"
       :foreground "#839496"
       :box '(:line-width 1 :color "#002b36" :style nil))
      (set-face-attribute
       'tabbar-unselected nil
       :background "#002b36"
       :foreground "#839496"
       :box '(:line-width 5 :color "#002b36" :style nil))
      (set-face-attribute
       'tabbar-selected nil
       :background "#002b36"
       :foreground "#cb4b16"
       :box '(:line-width 5 :color "#002b36" :style nil))
      (set-face-attribute
       'tabbar-highlight nil
       :background "#002b36"
       :foreground "#859900"
       :underline nil
       :box '(:line-width 5 :color "#002b36" :style nil))
      (set-face-attribute
       'tabbar-button nil
       :box '(:line-width 1 :color "#002b36" :style nil))
      (set-face-attribute
       'tabbar-separator nil
       :background "#002b36"
       :height 0.6)


      (spacemacs|define-micro-state tabbar-manipulation
        :doc "[?] for help"
        :evil-leader "E"
        :bindings
        ("?" nil)
        ("h" tabbar-backward-tab)
        ("j" tabbar-forward)
        ("k" tabbar-backward)
        ("l" tabbar-forward-tab)
        )
      )
    )
  )
