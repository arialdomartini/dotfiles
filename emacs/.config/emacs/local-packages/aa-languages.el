(use-package eglot
  :ensure t)

(use-package rainbow-delimiters
  :ensure t
  :config
  (add-hook 'prog-mode-hook #'rainbow-delimiters-mode))

(use-package haskell-mode
  :ensure t
  :config
  (add-hook 'haskell-mode-hook #'eglot-ensure))

(progn
  (use-package fsharp-mode
    :ensure t)
  (use-package eglot-fsharp
    :ensure t
    :config
    (setq eglot-fsharp-server-install-dir "~/.dotnet/tools/")
    (add-hook 'fsharp-mode-hook #'eglot-ensure)))

(use-package aggressive-indent
  :ensure t
  :config
  (add-hook 'emacs-lisp-mode-hook #'aggressive-indent-mode))


(provide 'aa-languages)
