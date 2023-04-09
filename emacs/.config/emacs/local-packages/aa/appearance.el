(setq inhibit-splash-screen t)
(tool-bar-mode -1)
(menu-bar-mode -1)
(scroll-bar-mode -1)
(horizontal-scroll-bar-mode -1)
(setq blink-cursor -1)
(blink-cursor-mode -1)


(use-package all-the-icons
  :ensure t
  :config
  (require 'all-the-icons))

(use-package all-the-icons-dired
  :ensure t
  :config
    (setq all-the-icons-dired-monochrome nil) ;; does not work...
  :hook ((dired-mode) . all-the-icons-dired-mode))

(use-package doom-modeline
  :ensure t
  :init (doom-modeline-mode 1)
  :config 
  (setq doom-modeline-buffer-state-icon nil)
  (setq doom-modeline-indent-info t)
  (setq doom-modeline-lsp t))

;(set-frame-font "PragmataPro Liga 18" nil t)
(set-frame-font "Monoid 18" nil t)
;(set-frame-font "Iosevka 18" nil t)
;(set-frame-font "Cascadia Code 18" nil t)

;; curiusly, this works for Monoid 18 too
(use-package ligature-pragmatapro :ensure t)
(ligature-pragmatapro-setup)
(global-ligature-mode)

(use-package solarized-theme
  :config
  (load-theme 'solarized-selenized-dark t))


(use-package switch-window
  :ensure t
  :config
  (setq switch-window-shortcut-style 'qwerty)
  (global-set-key (kbd "C-x o") 'switch-window)
  (setq switch-window-auto-resize-window t)
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

(use-package nyan-mode
  :ensure t
  :config
  (nyan-mode 0)
  (nyan-start-animation)
  (nyan-toggle-wavy-trail))


(pixel-scroll-precision-mode)

;; Magit reuses the whole buffer
(add-to-list 'display-buffer-alist
	     '((derived-mode . magit-status-mode)
	       (display-buffer-reuse-window display-buffer-same-window)))


(provide 'aa/appearance)
