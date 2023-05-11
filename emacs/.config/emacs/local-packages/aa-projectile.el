(use-package projectile
  :ensure t
  :config
  (projectile-mode +1)
  (setq projectile-project-search-path '("~/prg/" . 1))
  :bind (:map projectile-mode-map
              ("C-c p" . projectile-command-map)))

(use-package ag
  :ensure t)

(use-package ripgrep
  :ensure t)

(provide 'aa-projectile)
