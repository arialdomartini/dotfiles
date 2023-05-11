(use-package all-the-icons
  :ensure t
  :config
  (require 'all-the-icons))

(use-package all-the-icons-dired
  :ensure t
  :config
    (setq all-the-icons-dired-monochrome nil) ;; does not work...
  :hook ((dired-mode) . all-the-icons-dired-mode))

(provide 'aa-icons)
