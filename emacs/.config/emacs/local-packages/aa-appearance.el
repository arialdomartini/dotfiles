(setq inhibit-splash-screen t)
(tool-bar-mode -1)
(menu-bar-mode -1)
(scroll-bar-mode -1)
(horizontal-scroll-bar-mode -1)
(setq blink-cursor -1)
(blink-cursor-mode -1)
(setq help-window-select t)

(use-package hl-line
  :config
  (global-hl-line-mode)

  (defun aa/disable-hl-line-mode ()
    "Unconditionally disable `hl-line-mode'."
    (setq-local hl-line-mode nil
		global-hl-line-mode nil)
    (global-hl-line-unhighlight)))

(pixel-scroll-precision-mode)

;; Magit reuses the whole buffer
(add-to-list 'display-buffer-alist
	     '((derived-mode . magit-status-mode)
	       (display-buffer-reuse-window display-buffer-same-window)))


(use-package olivetti
  :ensure t)

;; goggles
(use-package volatile-highlights
  :ensure t
  :config
  (defun aa-volatile-highlights-set-background (_theme)
    (set-face-attribute 'vhl/default-face nil :background (face-attribute 'mode-line :background)))
    (add-hook 'enable-theme-functions 'aa-volatile-highlights-set-background)
  (volatile-highlights-mode t))


(use-package pulsar
  :ensure t
  :config
  (setq pulsar-pulse t
	pulsar-delay 0.055
	pulsar-iterations 10
	pulsar-face 'pulsar-green
	pulsar-highlight-face 'pulsar-yellow
	pulsar-global-mode 1))


(use-package rainbow-mode
  :ensure t
  :hook ((prog-mode . rainbow-mode)))

(provide 'aa-appearance)
