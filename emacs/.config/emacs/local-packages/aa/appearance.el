(setq inhibit-splash-screen t)
(tool-bar-mode -1)
(menu-bar-mode -1)
(scroll-bar-mode -1)
(horizontal-scroll-bar-mode -1)
(setq blink-cursor -1)
(blink-cursor-mode -1)

(set-frame-font "Monoid 20")
(load-theme 'adwaita)

(unless (package-installed-p 'nyan-mode)
  (package-vc-install "https://github.com/TeMPOraL/nyan-mode.git"))
(use-package nyan-mode
  :config
  (nyan-mode 0)
  (nyan-start-animation)
  (nyan-toggle-wavy-trail))


(pixel-scroll-precision-mode)

(provide 'aa/appearance)
