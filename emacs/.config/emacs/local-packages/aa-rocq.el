;; rocq-mode
(use-package rocq-mode
  :vc (:url "https://codeberg.org/jpoiret/rocq-mode.el.git" :rev :newest)
  :mode "\\.v\\'"
  :config
  (set-face-attribute 'rocq-mode-last-goal-request nil
                      :background (face-attribute 'transient-value :background)
                      :extend t)
  (face-spec-reset-face 'rocq-mode-processing-face)
  (set-face-attribute 'rocq-mode-processing-face nil
                      :background (face-attribute 'region :background)
                      :extend t)
  :hook
  (rocq-mode . eglot-ensure)
  (rocq-mode . rocq-follow-viewport-mode)
  (rocq-mode . rocq-auto-goals-at-point-mode))

(provide 'aa-rocq)
