;; Enable packages
(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/") t)
(package-initialize)

;; install use-package
(unless (package-installed-p 'use-package)
  (progn
    (unless package-archive-contents
      (package-refresh-contents))
    (package-install 'use-package))
  (eval-when-compile
    (require 'use-package)))
(setq use-package-always-ensure t)

;; packages
(use-package better-defaults)
(use-package magit)
(use-package counsel
  :ensure t
  :bind
  ("M-x" . counsel-M-x)
  ("C-x C-f" . counsel-find-file)
  ("C-c k" . counsel-ag)
  ("C-x b" . counsel-switch-buffer)
  ("C-s" . swiper))
(use-package markdown-mode)
(use-package solidity-mode)
(use-package ace-jump-mode
  :bind
  ("C-;" . ace-jump-word-mode))

;; ivy swiper
(setq ivy-height 40)

;; No Splash screen
(setq inhibit-spash-screen t)
(setq inhibit-startup-screen t)

(toggle-frame-fullscreen)
(load-theme 'deeper-blue)


;; set tabs to 4 spaces
(setq c-basic-offset 4)

