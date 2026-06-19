;; rocq-mode
(use-package rocq-mode
  :vc (:url "https://codeberg.org/jpoiret/rocq-mode.el.git" :rev :newest)
  :mode "\\.v\\'"
  :config
  (set-face-attribute 'rocq-mode-last-request nil
                      :background (face-attribute 'transient-value :background)
                      :extend t)
  (face-spec-reset-face 'rocq-mode-processing-face)
  (set-face-attribute 'rocq-mode-processing-face nil
                      :background (face-attribute 'region :background)
                      :extend t)

  ;; Display goal buffer on the right, shrinked.
  (add-to-list 'display-buffer-alist
               '((major-mode . rocq-goal-mode)
                 (display-buffer-in-side-window)
                 (side . bottom)
                 (slot . 0)
                 (window-width . 0.30)
                 (preserve-size . (t . nil))))
  ;; Smaller font for goal buffer.
  (add-hook 'rocq-goals-mode-hook
            (lambda () (text-scale-set -3)))



  :hook
  (rocq-mode . eglot-ensure)
  (rocq-mode . rocq-follow-viewport-mode)
  (rocq-mode . rocq-auto-goals-at-point-mode)
  (rocq-mode .
             (lambda ()
               (setq prettify-symbols-alist
                     '(("forall" . ?∀)
                       ("exists" . ?∃)
                       (":="     . ?≔)
                       ("=?"     . ?≟)
                       ("<>"     . ?≠)
                       ("not"   . ?¬)
                       ("&&"   . ?∧)
                       ("||"    . ?∨)
                       ("*"    . ?×)
                       ("<->"  . ?↔)
                       ("\\/"  . ?∨ )
                       ("/\\"  . ?∧ )
                       ("Type" . ?𝕌)
                       ("simpl" . ?β)
                       ("reflexivity" . ?✓)
                       ("Proof.". ?▽)
                       ("Qed."   . ?☐)))
               (prettify-symbols-mode 1)))

  (rocq-mode . prettify-symbols-mode))

(provide 'aa-rocq)
