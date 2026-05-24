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
                 (display-buffer-same-window)))
  :config
  ;; (setq majutsu-log-template-change-id
  ;;       [:label
  ;;        [:separate " "
  ;;                   [:if [:current_working_copy] "working_copy"]
  ;;                   [:if [:immutable] "immutable" "mutable"]
  ;;                   [:if [:conflict] "conflicted"]]
  ;;        [:pad_end 8
  ;;                  [:coalesce
  ;;                   [:if [:hidden]
  ;;                        [:label "hidden" [:change_id :shortest]]]
  ;;                   [:if [:divergent]
  ;;                        [:label "divergent" [:change_id :shortest]]]
  ;;                   [:change_id :shortest]]]])





  (setq majutsu-log-template-change-id
        [:label
         [:separate " "
                    [:if [:current_working_copy] "working_copy"]
                    [:if [:immutable] "immutable" "mutable"]
                    [:if [:conflict] "conflicted"]]
         [:pad_end 8
                   [:coalesce
                    [:if [:hidden]
                         [:label "hidden" [:change_id :shortest]]]
                    [:if [:divergent]
                         [:label "divergent" [:change_id :shortest]]] ;; do not display grayed-out elements of the id
                    [:change_id :shortest]]
                   "\u00A0"]]) ;; non-breaking space
  (add-hook 'majutsu-log-mode-hook
            (lambda () (setq-local nobreak-char-display nil)))) ;; hide non-breaking spaces

;; (majutsu-log--invalidate-template-cache)

(provide 'aa-jujutsu)
