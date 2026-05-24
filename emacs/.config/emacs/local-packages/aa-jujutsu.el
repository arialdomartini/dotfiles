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
  (add-to-list 'display-buffer-alist
               '((major-mode . majutsu-diff-mode)
                 (display-buffer-full-frame)))
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


  (setq majutsu-log-commit-columns
        '((:field id :align left :visible nil)
          (:field change-id :align left)
          (:field bookmarks :align left)
          (:field tags :align left)
          (:field working-copies :align left)
          (:field empty :align left)
          (:field git-head :align left :visible nil)
          (:field description :align left)
          (:field author :align right)
          (:field timestamp :align right)
          (:field commit-id :align right :visible nil)
          (:field flags :align left :visible nil)
          (:field long-desc :visible nil)))

  (setq majutsu-log-template-author
        [:if [:== [:author :email] "arialdo.martini@gmail.com"]
             ""
             [:author :name]])


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
