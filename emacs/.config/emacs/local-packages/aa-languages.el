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
  (defun aa-turn-aggressive-indent-mode-on ()
    (aggressive-indent-mode t)
    (message "Let's be aggressive! ARRR"))
  (add-hook 'emacs-lisp-mode-hook #'aa-turn-aggressive-indent-mode-on))

(use-package markdown-toc
  :ensure t)

(provide 'aa-languages)
