(use-package modus-themes
  :ensure t
  :config
  (defun aa-borderless-line (_theme)
    (set-face-attribute 'mode-line nil          :box nil :underline nil  :overline nil)
    (set-face-attribute 'mode-line-inactive nil :box nil :underline nil  :overline nil))
  (add-hook 'enable-theme-functions 'aa-borderless-line)
  (setq modus-themes-org-blocks 'gray-background))

;;(modus-themes-load-theme 'modus-operandi-tinted)

(use-package theme-buffet
  :config
  (theme-buffet-timer-mins 30)
  (setq theme-buffet-menu 'modus-ef)
  (theme-buffet-anything-goes))



;; (use-package base16-theme
;;   :ensure t
;;   :config
;;   (load-theme 'base16-default-dark t))


(provide 'aa-theme)
