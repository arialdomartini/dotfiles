(use-package switch-window
  :ensure t
  :config
  (setq switch-window-shortcut-style 'qwerty)
  (global-set-key (kbd "C-x o") 'switch-window)
  (setq switch-window-auto-resize-window nil)
  (setq switch-window-default-window-size 0.65) ;auto resize to 65% of frame size
  (switch-window-mouse-mode)) ;auto resize with mouse too

(global-set-key (kbd "C-x C-b") 'ibuffer)

(use-package windmove
  :ensure nil
  :config
  (global-set-key (kbd "C-M-S-<up>") 'windmove-up)
  (global-set-key (kbd "C-M-S-<down>") 'windmove-down)
  (global-set-key (kbd "C-M-S-<left>") 'windmove-left)
  (global-set-key (kbd "C-M-S-<right>") 'windmove-right)

  (global-set-key (kbd "<C-M-S-s-up>")     'windmove-swap-states-up)
  (global-set-key (kbd "<C-M-S-s-down>")   'windmove-swap-states-down)
  (global-set-key (kbd "<C-M-S-s-left>")   'windmove-swap-states-left)
  (global-set-key (kbd "<C-M-S-s-right>")  'windmove-swap-states-right))

(use-package winner
  :ensure nil
  :config
  (winner-mode t))

(use-package buffer-expose
  :ensure t)

(use-package avy :ensure t
  :config 
  (global-set-key (kbd "C-;") 'avy-goto-word-1)
  (global-set-key (kbd "C-:") 'avy-goto-line))


(setq ediff-split-window-function 'split-window-horizontally)
(setq ediff-window-setup-function 'ediff-setup-windows-plain) 

(global-set-key (kbd "<f12>")  #'jump-to-register)
(setq scroll-preserve-screen-position 'always)


(use-package tab-bar
  :defer t
  :config

  (defun tab-bar-view-toggle ()
    (interactive)
    (setopt tab-bar-show (not tab-bar-show)))

  (let ((default-bg (face-background 'default))
        (default-fg (face-foreground 'default))
        (inactive-fg (face-foreground 'mode-line-inactive)))
    (custom-set-faces
     ;; Tab bar background and text
     `(tab-bar ((t (:inherit default :background ,default-bg :foreground ,default-fg))))
     ;; Active tab: theme-adaptive colors, no border
     `(tab-bar-tab ((t (:inherit default :background ,default-fg :foreground ,default-bg :box nil))))
     ;; Inactive tab: theme-adaptive colors, no border
     `(tab-bar-tab-inactive ((t (:inherit default :background ,default-bg :foreground ,inactive-fg :box nil))))))
  :bind
  (("C-x t s" . tab-bar-view-toggle)
   ("M-<left>" . tab-previous)
   ("M-<right>" . tab-next)))


(use-package dimmer
  :config
  (setq dimmer-fraction .5))



(provide 'aa-windows)
