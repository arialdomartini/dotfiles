
(setq-default mode-line-format
	      '("%e"
		mode-line-front-space

		(:propertize
		 ("" mode-line-mule-info mode-line-client mode-line-modified mode-line-remote)
		 display (min-width (5.0)))

		mode-line-frame-identification

		mode-line-buffer-identification
		"   "

		(:eval
		 (when (mode-line-window-selected-p) mode-line-position))

		(vc-mode vc-mode)
		"  " mode-line-modes mode-line-misc-info mode-line-end-spaces))


(use-package moody
  :ensure t
  :config
  (setq x-underline-at-descent-line t)
  (moody-replace-mode-line-buffer-identification)
  (moody-replace-vc-mode)
  (moody-replace-eldoc-minibuffer-message-function))

(use-package nyan-mode
  :ensure t
  :config
  (nyan-mode 1)
  (nyan-start-animation)
  (nyan-toggle-wavy-trail))

(provide 'aa-mode-line)
