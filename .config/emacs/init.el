;; _*_ lexical-binding: t _*_
;; Needed for straight.el, see https://github.com/radian-software/straight.el/blob/master/README.md#getting-started
(setq package-enable-at-startup nil)

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


;; Load straight.el, as for https://github.com/radian-software/straight.el#getting-started
(defvar bootstrap-version)
(let ((bootstrap-file
       (expand-file-name "straight/repos/straight.el/bootstrap.el" user-emacs-directory))
      (bootstrap-version 6))
  (unless (file-exists-p bootstrap-file)
    (with-current-buffer
        (url-retrieve-synchronously
         "https://raw.githubusercontent.com/radian-software/straight.el/develop/install.el"
         'silent 'inhibit-cookies)
      (goto-char (point-max))
      (eval-print-last-sexp)))
  (load bootstrap-file nil 'nomessage))
(setq straight-use-package-by-default t)
