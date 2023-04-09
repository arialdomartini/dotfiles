(setq inhibit-splash-screen t)
(tool-bar-mode -1)
(menu-bar-mode -1)
(scroll-bar-mode -1)
(horizontal-scroll-bar-mode -1)
(setq blink-cursor -1)
(blink-cursor-mode -1)

(global-hl-line-mode)

(pixel-scroll-precision-mode)

;; Magit reuses the whole buffer
(add-to-list 'display-buffer-alist
	     '((derived-mode . magit-status-mode)
	       (display-buffer-reuse-window display-buffer-same-window)))


(use-package nyan-mode
  :ensure t
  :config
  (nyan-mode 0)
  (nyan-start-animation)
  (nyan-toggle-wavy-trail))


(use-package volatile-highlights
  :ensure t
  :config
  (volatile-highlights-mode t)
  (set-face-attribute 'vhl/default-face nil :background "#113322"))

(use-package beacon
  :ensure t
  :config
  (beacon-mode t))

(provide 'aa/appearance)
