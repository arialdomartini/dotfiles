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

(use-package fsharp-mode
  :ensure t)
(use-package eglot-fsharp
  :ensure t
  :after fsharp-mode
  :config
  ;; The original function used to prefix "dotnet" to the fsautocomplete path
  (defun eglot-fsharp--path-to-server ()
    "Return FsAutoComplete path."
    (file-truename (concat eglot-fsharp-server-install-dir "fsautocomplete" (if (eq system-type 'windows-nt) ".exe" ""))))

  (setq eglot-fsharp-server-install-dir "~/.dotnet/tools/")
  (add-hook 'fsharp-mode-hook #'eglot-ensure))

(use-package aggressive-indent
  :ensure t
  :config
  (add-hook 'emacs-lisp-mode-hook #'aggressive-indent-mode))


(provide 'aa-languages)
