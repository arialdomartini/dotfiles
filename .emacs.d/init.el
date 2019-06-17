;; Enable packages
(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/") t)
(package-initialize)

;; save Custom settings in a separate file
(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
   (when (file-exists-p custom-file)
       (load custom-file))

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
(use-package magit
  :bind
  ("C-x g" . magit-status))
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
(use-package switch-window
  :bind
  ("C-x o" . switch-window))
;; ivy swiper
(setq ivy-height 40)

;; No Splash screen
(setq inhibit-spash-screen t)
(setq inhibit-startup-screen t)

(toggle-frame-fullscreen)
(load-theme 'deeper-blue)

;; increase the minibuffer font
(add-hook 'minibuffer-setup-hook 'set-minibuffer-font)
(defun set-minibuffer-font ()
       (set (make-local-variable 'face-remapping-alist)
          '((default :height 1.5))))

;; set tabs to 4 spaces
(setq c-basic-offset 4)
