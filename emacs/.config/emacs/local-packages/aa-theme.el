(use-package modus-themes
  :ensure t
  :config
  (defun aa-borderless-line (_theme)
    (set-face-attribute 'mode-line nil          :box nil :underline nil  :overline nil)
    (set-face-attribute 'mode-line-inactive nil :box nil :underline nil  :overline nil))
  (add-hook 'enable-theme-functions 'aa-borderless-line)

  (modus-themes-load-theme 'modus-operandi-tinted))

(provide 'aa-theme)
