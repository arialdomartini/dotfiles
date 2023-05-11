;; backups
(setq
 backup-inhibited nil ; enable backups
 backup-by-copying t
 backup-directory-alist '(("." . "~/.saves")) ; this must be created beforehand
 delete-old-versions t
 kept-new-versions 6
 kept-old-versions 2
 version-control t
 create-lockfiles nil)

(provide 'aa-backup)
