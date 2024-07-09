;; prevent Emacs from modifying configuration files
(setq custom-file (make-temp-file "emacs-custom-"))

(setq warning-minimum-level :error)

(put 'dired-find-alternate-file 'disabled nil)
(add-hook 'dired-mode-hook 'dired-hide-details-mode)
(setq-default indent-tabs-mode nil)

(setq global-mark-ring-max 100)
(setq mark-ring-max 25)

(electric-pair-mode t)
(delete-selection-mode t)

(defalias 'yes-or-no-p 'y-or-n-p)

(global-set-key (kbd "M-z") 'zap-up-to-char)

(progn
  (defun kill-current-buffer (&optional arg)
    (interactive (list current-prefix-arg))
    (let ((kill-buffer-query-functions ()))
      (if arg
	  (kill-buffer)
	(kill-buffer-and-window))))
  (global-set-key (kbd "C-x k") 'kill-current-buffer))


;; Dired
(setq
 delete-by-moving-to-trash t
 dired-kill-when-opening-new-dired-buffer t)


;; (use-package dirvish
;;   :ensure t
;;   :config
;;   (dirvish-override-dired-mode))

(progn
  ;; copied from Prot's `prot-simple-keyboard-quit-dwim'
  (defun aa-simple-keyboard-quit-dwim ()
    "Do-What-I-Mean behaviour for a general `keyboard-quit'.

The generic `keyboard-quit' does not do the expected thing when
the minibuffer is open.  Whereas we want it to close the
minibuffer, even without explicitly focusing it.

The DWIM behaviour of this command is as follows:

- When the region is active, disable it.
- When a minibuffer is open, but not focused, close the minibuffer.
- When the Completions buffer is selected, close it.
- In every other case use the regular `keyboard-quit'."
    (interactive)
    (cond
     ((region-active-p)
      (keyboard-quit))
     ((derived-mode-p 'completion-list-mode)
      (delete-completion-window))
     ((> (minibuffer-depth) 0)
      (abort-recursive-edit))
     (t
      (keyboard-quit))))

  (define-key global-map [remap keyboard-quit] 'aa-simple-keyboard-quit-dwim) )

;; Tab = 4 spaces
(setq sgml-basic-offset 4)

(provide 'aa-defaults)
