; no menu bar
(menu-bar-mode -1)
(tool-bar-mode -1)

; no scroll bars
(scroll-bar-mode 0)

; enable narrowing
(put 'narrow-to-region 'disabled nil)

; backups in .saves
(setq backup-directory-alist `(("." . "~/.saves")))
(setq backup-by-copying t)
(setq delete-old-versions t
  kept-new-versions 6
  kept-old-versions 2
  version-control t)

; shorter yes-no-dialogs
(fset 'yes-or-no-p 'y-or-n-p)

; highlight parenthesis
(show-paren-mode t)


;; Package managers

; marmalade
(require 'package)
(add-to-list 'package-archives 
    '("marmalade" .
      "http://marmalade-repo.org/packages/"))
(add-to-list 'package-archives 
    '("melpa" . 
      "http://melpa.milkbox.net/packages/") t)
(package-initialize)


;; el-get
(add-to-list 'load-path "~/.emacs.d/el-get/el-get")


(unless (require 'el-get nil 'noerror)
  (with-current-buffer
      (url-retrieve-synchronously
       "https://raw.github.com/dimitri/el-get/master/el-get-install.el")
    (goto-char (point-max))
    (eval-print-last-sexp)))

(add-to-list 'el-get-recipe-path "~/.emacs.d/el-get-user/recipes")
(el-get 'sync)





;; Set up the package manager of choice. Supports "el-get" and "package.el"
(setq pmoc "el-get")

;; List of all wanted packages
(setq
 wanted-packages
 '(
   ace-jump-mode
   smex
   autopair
   ido-hacks
   ido-vertical-mode
   switch-window
   company-mode
   multiple-cursors
   elixir
   erlang-mode
   highlight-indentation
   expand-region
   browse-kill-ring
   powerline
   color-theme-solarized
   go-mode
))

;; Package manager and packages handler
(defun install-wanted-packages ()
  "Install wanted packages according to a specific package manager"
  (interactive)
  (cond
   ;; package.el
   ((string= pmoc "package.el")
    (require 'package)
    (add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/"))
    (add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/"))
    (add-to-list 'package-archives '("marmelade" . "http://marmalade-repo.org/packages/"))
    (package-initialize)
    (let ((need-refresh nil))
      (mapc (lambda (package-name)
          (unless (package-installed-p package-name)
        (set 'need-refresh t))) wanted-packages)
      (if need-refresh
        (package-refresh-contents)))
    (mapc (lambda (package-name)
        (unless (package-installed-p package-name)
          (package-install package-name))) wanted-packages)
    )
   ;; el-get
   ((string= pmoc "el-get")
    (add-to-list 'load-path "~/.emacs.d/el-get/el-get")
    (unless (require 'el-get nil 'noerror)
      (with-current-buffer
      (url-retrieve-synchronously
       "https://raw.github.com/dimitri/el-get/master/el-get-install.el")
    (let (el-get-master-branch)
      (goto-char (point-max))
      (eval-print-last-sexp))))
    (el-get 'sync wanted-packages))
   ;; fallback
   (t (error "Unsupported package manager")))
  )

;; Install wanted packages
(install-wanted-packages)


;; packages
(require 'ace-jump-mode)
(require 'autopair)
(autopair-global-mode)

(require 'ido-hacks)
(require 'ido-vertical-mode)
(ido-mode t)
(ido-vertical-mode)

(require 'switch-window)
(global-set-key (kbd "C-x C-o") 'switch-window)

(add-hook 'after-init-hook 'global-company-mode)

(highlight-indentation-mode)
(set-face-background 'highlight-indentation-face "#222")
(set-face-background 'highlight-indentation-current-column-face "#955")
(add-hook 'prog-mode-hook #'highlight-indentation-mode)

(require 'expand-region)
(global-set-key (kbd "ESC <up>") 'er/expand-region)
(global-set-key (kbd "ESC <down>") 'er/contract-region)

(require 'go-mode)

; multiple-cursors
(require 'mouse)
(xterm-mouse-mode t)
(defun track-mouse (e))
(setq mouse-sel-mode t)
(global-set-key (kbd "C-S-<mouse-1>") 'mc/add-cursor-on-click)

; browser-kill-ring
(global-set-key (kbd "C-c C-y") 'browse-kill-ring)

; smex
(require 'smex)
(smex-initialize)
(global-set-key (kbd "M-x") 'smex)


; powerline
(require 'powerline)
(setq powerline-arrow-shape 'arrow)   ;; the default
(setq powerline-arrow-shape 'curve)   ;; give your mode-line curves
(setq powerline-arrow-shape 'arrow14)
(powerline-default-theme)


;theme
(load-theme 'solarized-dark t)


; always indent using spaces
(setq-default indent-tabs-mode nil)

; tabs are 4 chars
(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)
(setq indent-line-function 'insert-tab)

; tabs are 4 chars in python too
(add-hook 'python-mode-hook
  (lambda ()
    (setq indent-tabs-mode nil)
    (setq python-indent 4)
    (setq tab-width 4)))


; bs-show
(global-set-key (kbd "C-x C-m") 'bs-show)

; ace-jump-mode
(eval-when-compile
  (require 'cl))
(global-set-key (kbd "C-x C-j") 'ace-jump-word-mode)
(global-set-key (kbd "C-M-j") 'ace-jump-word-mode)
(global-set-key (kbd "C-x j") 'ace-jump-char-mode)

; highlight line mode
(global-hl-line-mode 1)
(set-face-background 'highlight "#333")
(set-face-foreground 'highlight nil)
(set-face-underline-p 'highlight nil)


; mak file are seen as html

(add-to-list 'auto-mode-alist '("\\.mak\\'" . html-mode))



; themes
(global-highlight-changes-mode 0)

;(set-face-foreground 'highlight-changes nil)
;(set-face-background 'highlight-changes "#382f2f")
;(set-face-foreground 'highlight-changes-delete nil)
;(set-face-background 'highlight-changes-delete "#916868")


(add-to-list 'auto-mode-alist '("\\.erl\\'" . erlang-mode))


;; New empty buffer
(defun my-new-empty-buffer ()
  "Open a new empty buffer, offering the option to save it when exiting emacs."
  (interactive)
  (let ((buf (generate-new-buffer "untitled")))
    (switch-to-buffer buf)
    (funcall (and initial-major-mode))
    (setq buffer-offer-save t)))
(global-set-key (kbd "C-c C-n") 'my-new-empty-buffer)


;; duplicate line or region
(defun duplicate-line-or-region (&optional n)
  "Duplicate current line, or region if active.
  With argument N, make N copies.
  With negative N, comment out original line and use the absolute value."
  (interactive "*p")
  (let ((use-region (use-region-p)))
    (save-excursion
      (let ((text (if use-region        ;Get region if active, otherwise line
                      (buffer-substring (region-beginning) (region-end))
                    (prog1 (thing-at-point 'line)
                      (end-of-line)
                      (if (< 0 (forward-line 1)) ;Go to beginning of next line, or make a new one
                          (newline))))))
        (dotimes (i (abs (or n 1)))     ;Insert N times, or once if not specified
          (insert text))))
    (if use-region nil                  ;Only if we're working with a line (not a region)
      (let ((pos (- (point) (line-beginning-position)))) ;Save column
        (if (> 0 n)                             ;Comment out original with negative arg
            (comment-region (line-beginning-position) (line-end-position)))
        (forward-line 1)
        (forward-char pos)))))

(global-set-key (kbd "C-c C-d") 'duplicate-line-or-region)



;(color-theme-dark-laptop)
;(color-theme-arjen)
;(color-theme-charcoal-black)
;(color-theme-jsc-dark)

; Fullscreen
(defun toggle-fullscreen ()
  "Toggle full screen"
  (interactive)
  (set-frame-parameter
     nil 'fullscreen
     (when (not (frame-parameter nil 'fullscreen)) 'fullboth)))

(set-frame-parameter nil 'fullscreen 'fullboth)

