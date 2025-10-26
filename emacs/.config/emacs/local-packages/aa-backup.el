;; backups

(let ((save-dir (expand-file-name ".saves" (file-name-directory user-init-file))))
  (make-directory save-dir t)
  (setq
   backup-inhibited nil ; enable backups
   backup-by-copying t
   backup-directory-alist '(("." . save-dir)) ; this must be created beforehand
   auto-save-file-name-transforms `((".*" ,(concat save-dir "/\\1") t))
   delete-old-versions t
   kept-new-versions 6
   kept-old-versions 2
   version-control t
   create-lockfiles nil))

(provide 'aa-backup)
