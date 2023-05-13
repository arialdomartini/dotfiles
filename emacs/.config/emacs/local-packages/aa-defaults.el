;; prevent Emacs from modifying configuration files
(setq custom-file (make-temp-file "emacs-custom-"))
(when (and custom-file (file-exists-p custom-file))
   (load-file custom-file))

(setq warning-minimum-level :error)

(put 'dired-find-alternate-file 'disabled nil)

(electric-pair-mode t)
(delete-selection-mode t)

(defalias 'yes-or-no-p 'y-or-n-p)


(defun kill-current-buffer (&optional arg)
	"Kill the current buffer without prompting. With a prefix ARG, invoke `kill-buffer' instead."
	(interactive)
	(if arg
	    (call-interactively #'kill-buffer)
	  (kill-buffer (current-buffer))))
(global-set-key (kbd "C-x k") 'kill-current-buffer)

(provide 'aa-defaults)
