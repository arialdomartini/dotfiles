(use-package eglot
  :ensure t
  :config
  (setq eglot-autoshutdown t))

(use-package rainbow-delimiters
  :ensure t
  :config
  (add-hook 'prog-mode-hook #'rainbow-delimiters-mode))

(use-package haskell-mode
  :ensure t
  :config
  (add-hook 'haskell-mode-hook #'eglot-ensure)
  (add-hook 'haskell-mode-hook #'haskell-decl-scan-mode)
  (define-key haskell-mode-map (kbd "M-RET")#'eglot-code-actions))

(use-package fsharp-mode
  :ensure t)
(use-package eglot-fsharp
  :ensure t
  :after fsharp-mode
  :config
  (setq eglot-fsharp-server-install-dir nil)
  (add-hook 'fsharp-mode-hook #'eglot-ensure))

(use-package aggressive-indent
  :ensure t
  :config
  (add-hook 'emacs-lisp-mode-hook #'aggressive-indent-mode))


(provide 'aa-languages)
