(use-package page-break-lines
  :ensure t
  :config
  (global-page-break-lines-mode))

(use-package dashboard
  :ensure t
  :init
  (setq
   dashboard-startup-banner (concat user-emacs-directory "logo.png")
   dashboard-image-banner-max-width 250
   dashboard-banner-logo-title nil
   dashboard-center-content t)
  
  :config
  (dashboard-setup-startup-hook)
  (text-scale-set 1)
  (setq dashboard-items '((recents . 7)
                          (bookmarks . 3)
                          (projects . 5))
	text-scale .2))

;; (custom-set-faces
;;   '(dashboard-heading-face ((t (:inherit font-lock-header-face :weight bold :height .5))))
;;   '(dashboard-items-face ((t (:inherit font-lock-keyword-face :height .2)))))

(provide 'aa-dashboard)
