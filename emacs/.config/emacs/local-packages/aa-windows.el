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
  (global-set-key (kbd "C-M-S-<right>") 'windmove-right))

(winner-mode t)

(use-package buffer-move
  :config
  (global-set-key (kbd "<C-M-S-s-up>")     'buf-move-up)
  (global-set-key (kbd "<C-M-S-s-down>")   'buf-move-down)
  (global-set-key (kbd "<C-M-S-s-left>")   'buf-move-left)
  (global-set-key (kbd "<C-M-S-s-right>")  'buf-move-right))


(use-package buffer-expose
  :ensure t)

(use-package avy :ensure t
  :config 
  (global-set-key (kbd "C-;") 'avy-goto-word-1)
  (global-set-key (kbd "C-:") 'avy-goto-line))


(provide 'aa-windows)
