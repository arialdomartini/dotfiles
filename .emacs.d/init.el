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

;; No Splash screen
(setq inhibit-spash-screen t)
(setq inhibit-startup-screen t)

(toggle-frame-fullscreen)
