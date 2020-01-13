;; Enable packages
(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/") t)
(package-initialize)

;; backup files
(setq
   backup-by-copying t
   backup-directory-alist '(("." . "~/.saves/"))
   delete-old-versions t
   kept-new-versions 6
   kept-old-versions 2
   version-control t)

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
;; guide-key
(use-package which-key
  :config
  (which-key-mode)
  (which-key-setup-side-window-bottom)
  (set-face-attribute 'which-key-key-face nil :height 1.6)
  (set-face-attribute 'which-key-separator-face nil :height 1.6)
  (set-face-attribute 'which-key-note-face nil :height 1.6)
  (set-face-attribute 'which-key-command-description-face nil :height 1.6)
  (set-face-attribute 'which-key-group-description-face nil :height 1.6))


;;(setq which-key-max-description-length nil)
;;(setq which-key-max-display-columns 4)
(setq which-key-side-window-max-width 0.90)

(use-package magit
  :bind
  ("C-x g" . magit-status))

(use-package counsel
  :ensure t
  :bind
  ("M-x" . counsel-M-x)
  ("C-x C-f" . counsel-find-file)
  ("C-c k" . counsel-ag)
  ("C-x b" . counsel-ibuffer)
  ("C-s" . swiper))

(use-package ivy-prescient
  :config
  (ivy-prescient-mode 1))
(use-package markdown-mode)
(use-package haskell-mode)
(use-package solidity-mode)
(use-package go-mode)

(use-package avy
  :bind
  ("C-;" . avy-goto-word-or-subword-1)
  ("C-c j l" . avy-goto-line)
  ("C-c j c" . avy-goto-char)
  )

(use-package avy-zap
  :bind
  ("M-;" . avy-zap-to-char))

(use-package multiple-cursors
  :bind
  ("C->" . mc/mark-next-like-this)
  ("C-S->" . mc/mark-all-words-like-this))

(use-package expand-region
  :bind
  ("C-=" . er/expand-region)
  ("C-+" . er/contract-region))

(use-package switch-window
  :bind
  ("C-x o" . switch-window))
;; ivy swiper
(setq ivy-height 15)

;; save-place
(use-package saveplace
  :config
  (setq save-place-file "~/.emacs.d/saveplace")
  (setq-default save-place t))



;; zap-up-to-char
(autoload 'zap-up-to-char
  "misc"  "Kill up to, but not including ARGth occurrence of CHAR." t)
(global-set-key (kbd "M-z") 'zap-up-to-char)


;; set tabs to 4 spaces
(setq c-basic-offset 4)
(setq-default indent-tabs-mode nil)

(show-paren-mode 1)

;; always prefer y-n over yes-no
(defalias 'yes-or-no-p 'y-or-n-p)


;; Layout
;; No Splash screen
(setq inhibit-spash-screen t)
(setq inhibit-startup-screen t)

;; increase the minibuffer font
(add-hook 'minibuffer-setup-hook 'set-minibuffer-font)
(defun set-minibuffer-font ()
       (set (make-local-variable 'face-remapping-alist)
          '((default :height 2.5))))


(toggle-frame-fullscreen)
(load-theme 'deeper-blue)
(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)
(horizontal-scroll-bar-mode -1)


;; Kill buffer
(global-set-key (kbd "C-x k") 'kill-this-buffer)

;; set tabs to 4 spaces
(setq c-basic-offset 4)

;; enable the possibility to navigate in dired using "a"
(put 'dired-find-alternate-file 'disabled nil)
