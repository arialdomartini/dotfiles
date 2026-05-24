;; (use-package majutsu
;;   :vc (:url "https://github.com/0WD0/majutsu")
;;   :init
;;   (setq majutsu-no-confirm '(abandon undo))
;;   :bind (:map majutsu-commit-section-map
;;               ("N" . majutsu-new-dwim)
;;               ;; ("e" . majutsu-edit-changeset)
;;               )
;;   :config
;;   (transient-suffix-put 'majutsu-dispatch (kbd "O") :key "N"))

(use-package majutsu
  :vc (:url "https://github.com/0WD0/majutsu")
  :init
  (setq majutsu-no-confirm '(abandon undo))
  (add-to-list 'display-buffer-alist
               '((major-mode . majutsu-log-mode)
                 (display-buffer-same-window))))

(provide 'aa-jujutsu)
