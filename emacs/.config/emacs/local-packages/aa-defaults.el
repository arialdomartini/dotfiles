;; prevent Emacs from modifying configuration files
(setq custom-file (make-temp-file "emacs-custom-"))
(when (and custom-file (file-exists-p custom-file))
   (load-file custom-file))

(setq warning-minimum-level :error)

(put 'dired-find-alternate-file 'disabled nil)
(add-hook 'dired-mode-hook 'dired-hide-details-mode)

(electric-pair-mode t)
(delete-selection-mode t)

(defalias 'yes-or-no-p 'y-or-n-p)

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

(provide 'aa-defaults)
