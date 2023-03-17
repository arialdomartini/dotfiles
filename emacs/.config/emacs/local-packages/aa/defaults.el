;; prevent Emacs from modifying configuration files
(setq custom-file (make-temp-file "emacs-custom-"))
(when (and custom-file (file-exists-p custom-file))
   (load-file custom-file))

(setq warning-minimum-level :error)

(put 'dired-find-alternate-file 'disabled nil)

(provide 'aa/defaults)
