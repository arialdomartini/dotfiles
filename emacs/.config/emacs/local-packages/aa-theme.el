(use-package modus-themes
  :ensure t
  :config
  (defun aa-borderless-line (_theme)
    (set-face-attribute 'mode-line nil          :box nil :underline nil  :overline nil)
    (set-face-attribute 'mode-line-inactive nil :box nil :underline nil  :overline nil))
  (add-hook 'enable-theme-functions 'aa-borderless-line)
  (setq modus-themes-org-blocks 'gray-background)

  (modus-themes-load-theme 'modus-vivendi-deuteranopia))

(provide 'aa-theme)
