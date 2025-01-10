(use-package switch-window
  :ensure t
  :config
  (setq switch-window-shortcut-style 'qwerty)
  (global-set-key (kbd "C-x o") 'switch-window)
  (setq switch-window-auto-resize-window nil)
  (setq switch-window-default-window-size 0.65) ;auto resize to 65% of frame size
  (switch-window-mouse-mode)) ;auto resize with mouse too

(use-package windmove
  :config
  (global-set-key (kbd "C-M-S-<up>") 'windmove-up)
  (global-set-key (kbd "C-M-S-<down>") 'windmove-down)
  (global-set-key (kbd "C-M-S-<left>") 'windmove-left)
  (global-set-key (kbd "C-M-S-<right>") 'windmove-right)

  (global-set-key (kbd "<C-M-S-s-up>")     'windmove-swap-states-up)
  (global-set-key (kbd "<C-M-S-s-down>")   'windmove-swap-states-down)
  (global-set-key (kbd "<C-M-S-s-left>")   'windmove-swap-states-left)
  (global-set-key (kbd "<C-M-S-s-right>")  'windmove-swap-states-right))

(winner-mode t)

(use-package buffer-expose
  :ensure t)

(use-package avy :ensure t
  :config 
  (global-set-key (kbd "C-;") 'avy-goto-word-1)
  (global-set-key (kbd "C-:") 'avy-goto-line))


(setq ediff-split-window-function 'split-window-horizontally)
(setq ediff-window-setup-function 'ediff-setup-windows-plain) 

(provide 'aa-windows)
