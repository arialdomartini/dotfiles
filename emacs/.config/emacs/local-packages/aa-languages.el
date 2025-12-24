(use-package eglot
  :ensure t
  :config
  (setq eglot-autoshutdown t)
  :bind
  (:map prog-mode-map
        ("M-RET". eglot-code-actions))
  :custom
  (eglot-events-buffer-size 0) ; disable events logging, it should be enabled only when debuggigng LSP servers
  (eglot-sync-connect-nil 0) ; disable UI freeze when opening big files
  (eglot-connect-timeout nil)) ; never timeout


(use-package flymake
  :config
  ;; (set-face-attribute 'flymake-error  nil :inverse-video t)
  ;; (set-face-attribute 'flymake-warning  nil :inverse-video t)
  ;; (set-face-attribute 'flymake-note  nil :inverse-video t)
  :custom
  (flymake-mode-line-lighter "Fly")
  :hook prog-mode)


(use-package consult-eglot-embark)

(use-package consult-eglot
  :after (consult eglot embark)
  :config
  (require 'consult-eglot-embark)
  (consult-eglot-embark-mode))

(use-package consult-eglot
  :after (consult eglot embark)
  :config
  (require 'consult-eglot-embark)
  (consult-eglot-embark-mode))

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

;; (use-package haskell-mode
;;   :ensure t
;;   :mode "\\.hs\\'"
;;   :hook
;;   (haskell-mode . eglot-ensure)
;;   (haskell-mode . haskell-decl-scan-mode)
;;   :bind
;;   ( :map haskell-mode-map
;;     ("M-RET". eglot-code-actions)))

;; (use-package fsharp-mode
;;   :ensure t)

;; (use-package fsharp-ts-mode
;;   :vc ( :url "https://github.com/KaranAhlawat/fsharp-ts-mode"
;;         :rev "bd44b4e"))

;; (use-package fsharp-ts-mode
;;   :vc ( :url "https://github.com/KaranAhlawat/fsharp-ts-mode"
;;         :branch "main"))



(use-package eglot-fsharp
  :ensure t
  :after fsharp-mode
  :config
  (setq eglot-fsharp-server-install-dir nil)
  (add-hook 'fsharp-mode-hook #'eglot-ensure))


(use-package haskell-ts-mode
  :vc (:url "https://codeberg.org/pranshu/haskell-ts-mode")
  :mode "\\.hs\\'"
  :hook (haskell-ts-mode . eglot-ensure)
  :bind
  ( :map haskell-ts-mode-map
    ("M-RET". eglot-code-actions))
  :config
  (add-to-list 'eglot-server-programs '(haskell-ts-mode . ("haskell-language-server-wrapper" "--lsp"))))


(use-package idris-mode)

(use-package dts-mode
  :mode ("\\.keymap\\'" . dts-mode))
;; alternatively
;; (add-to-list 'auto-mode-alist '("\\.keymap\\'" . dts-mode))


(load-file (let ((coding-system-for-read 'utf-8))
             (shell-command-to-string "agda-mode locate")))

(use-package hs-minor-mode
  :ensure nil
  :bind
  ("C-M-<left>" . hs-hide-block)
  ("C-M-<right>" . hs-show-block)
  :hook
  (emacs-lisp-mode . hs-minor-mode))

(provide 'aa-languages)
