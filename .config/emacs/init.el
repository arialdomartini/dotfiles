;; _*_ lexical-binding: t _*_

(setq inhibit-splash-screen t)

(tool-bar-mode -1)
(menu-bar-mode -1)
(scroll-bar-mode -1)
(horizontal-scroll-bar-mode -1)
(setq blink-cursor -1)
(blink-cursor-mode -1)

;; backups
(setq
 backup-inhibited nil ; enable backups
 backup-by-copying t
 backup-directory-alist '(("." . "~/.saves")) ; this must be created beforehand
 delete-old-versions t
 kept-new-versions 6
 kept-old-versions 2
 version-control t)

(set-frame-font "Monoid 20")

;; Native comp
(setq
 native-comp-speed 3
 comp-speed 3)
;;; Speed up boot time by increasing GC thresholds during startup only
(setq
 gc-cons-threshold (* 64 1024 )
 gc-cons-percentage 0.6)
(add-hook 'emacs-startup-hook
          (lambda ()
            (setq
	     gc-cons-threshold (* 64 1024 1024)
	     gc-cons-percentage 0.1)))

