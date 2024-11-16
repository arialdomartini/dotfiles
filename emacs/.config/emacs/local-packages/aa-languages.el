(use-package eglot
  :ensure t
  :config
  (setq eglot-autoshutdown t))


(use-package c-ts-mode
  :ensure nil
  :config
  (add-hook 'c-mode-hook 'eglot-ensure)
  (add-hook 'c++-mode-hook 'eglot-ensure)
  (add-hook 'c++-ts-mode-hook 'eglot-ensure))

(use-package rainbow-delimiters
  :ensure t
  :config
  (add-hook 'prog-mode-hook #'rainbow-delimiters-mode))


(use-package aggressive-indent
  :ensure t
  :config
  (add-hook 'emacs-lisp-mode-hook #'aggressive-indent-mode))

(use-package nix-mode)


;; (use-package haskell-mode
;;   :ensure t
;;   :mode "\\.hs\\'"
;;   :hook
;;   (haskell-mode . eglot-ensure)
;;   (haskell-mode . haskell-decl-scan-mode)
;;   :bind
;;   ( :map haskell-mode-map
;;     ("M-RET". eglot-code-actions)))

(use-package fsharp-mode
  :ensure t)
(use-package eglot-fsharp
  :ensure t
  :after fsharp-mode
  :config
  (setq eglot-fsharp-server-install-dir nil)
  (add-hook 'fsharp-mode-hook #'eglot-ensure))


(use-package haskell-ts-mode
  :vc (:url https://codeberg.org/pranshu/haskell-ts-mode)
  :mode "\\.hs\\'"
  :hook (haskell-ts-mode . eglot-ensure)
  :bind
  ( :map haskell-ts-mode-map
    ("M-RET". eglot-code-actions))
  :config
  (add-to-list 'eglot-server-programs '(haskell-ts-mode . ("haskell-language-server-wrapper" "--lsp"))))


;; does not work properly
;; (use-package fsharp-ts-mode
;;   :vc (:url "https://github.com/KaranAhlawat/fsharp-ts-mode"))

(global-set-key (kbd "<XF86Tools>") 'consult-imenu)
(global-set-key (kbd "<XF86Launch5>") 'consult-outline)

(use-package dts-mode
  :mode ("\\.keymap\\'" . dts-mode))
;; alternatively
;; (add-to-list 'auto-mode-alist '("\\.keymap\\'" . dts-mode))



(provide 'aa-languages)
