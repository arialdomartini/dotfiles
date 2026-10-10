;; _*_ lexical-binding: t _*_

(use-package multiple-cursors
  :init
  :config
  (global-set-key (kbd "C-M-S-d") #'mc/mark-next-lines)
  (global-set-key (kbd "M-g m m") #'mc/mark-all-dwim)
  (add-to-list 'mc/cmds-to-run-once #'mc/mark-next-lines))

(provide 'aa-editing)
