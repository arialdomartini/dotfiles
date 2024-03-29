(use-package switch-window
  :ensure t
  :config
  (setq switch-window-shortcut-style 'qwerty)
  (global-set-key (kbd "C-x o") 'switch-window)
  (setq switch-window-auto-resize-window nil)
  (setq switch-window-default-window-size 0.65) ;auto resize to 65% of frame size
  (switch-window-mouse-mode)) ;auto resize with mouse too

;; windmove
(global-set-key (kbd "M-s-<up>") 'windmove-up)
(global-set-key (kbd "M-s-<down>") 'windmove-down)
(global-set-key (kbd "M-s-<left>") 'windmove-left)
(global-set-key (kbd "M-s-<right>") 'windmove-right)

(winner-mode t)

(use-package buffer-expose
  :ensure t)

(use-package avy :ensure t)
(global-set-key (kbd "C-;") 'avy-goto-word-1)
(global-set-key (kbd "C-'") 'avy-goto-word-0)


(provide 'aa-windows)
