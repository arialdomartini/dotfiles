(setq inhibit-splash-screen t)
(tool-bar-mode -1)
(menu-bar-mode -1)
(scroll-bar-mode -1)
(horizontal-scroll-bar-mode -1)
(setq blink-cursor -1)
(blink-cursor-mode -1)




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


(

(provide 'aa/appearance)
