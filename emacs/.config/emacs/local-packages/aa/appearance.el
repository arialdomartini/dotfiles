(setq inhibit-splash-screen t)
(tool-bar-mode -1)
(menu-bar-mode -1)
(scroll-bar-mode -1)
(horizontal-scroll-bar-mode -1)
(setq blink-cursor -1)
(blink-cursor-mode -1)


(set-frame-font "Monoid 14" nil t)



(use-package solarized-theme
  :config
  (load-theme 'solarized-selenized-dark t))


(use-package nyan-mode
  :ensure t
  :config
  (nyan-mode 0)
  (nyan-start-animation)
  (nyan-toggle-wavy-trail))


(pixel-scroll-precision-mode)

(provide 'aa/appearance)
