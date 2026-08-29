;; _*_ lexical-binding: t _*_

(use-package multiple-cursors
  :config
  (multiple-cursors-mode)
  (global-set-key (kbd "C-M-S-d") #'mc/mark-next-lines)
  (global-set-key (kbd "M-g m m") #'mc/mark-all-dwim))

(provide 'aa-editing)
