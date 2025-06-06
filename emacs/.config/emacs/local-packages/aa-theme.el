;; (use-package modus-themes
;;   :config
;;   (setq modus-themes-org-blocks 'gray-background))

;; (modus-themes-load-theme 'modus-vivendi)

(use-package ef-themes
  :config
  (defun aa-borderless-line (_theme)
    (set-face-attribute 'mode-line nil          :box nil :underline nil  :overline nil)
    (set-face-attribute 'mode-line-inactive nil :box nil :underline nil  :overline nil)

    (set-face-attribute 'tab-bar-tab nil :background "mail-other" :foreground "white")
    (set-face-attribute 'tab-bar-tab-inactive nil :background "bg-space-err" :foreground "white")
    (set-face-attribute 'tab-bar-tab nil :box nil)
    (set-face-attribute 'tab-bar-tab-inactive nil :box nil))

  (add-hook 'enable-theme-functions 'aa-borderless-line))

(ef-themes-select-dark 'ef-maris-dark)

;; (use-package base16-theme
;;   :ensure t
;;   :config
;;   (load-theme 'base16-default-dark t))


(provide 'aa-theme)
