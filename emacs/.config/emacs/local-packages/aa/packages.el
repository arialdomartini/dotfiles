;;(use-package consult)
(use-package expand-region
  :ensure t
  :bind ("C-=" . er/expand-region))

(use-package magit :ensure t)
;; (use-package projectile :ensure t)
;; (use-package embark :ensure t)
;; (use-package embark-consult :ensure t)
;; (use-package orderless :ensure t)

;; (use-package which-key :ensure t)
;; (use-package git-gutter :ensure t)
;; (use-package git-time-machine :ensure t)
;; (use-package ripgrep :ensure t)
;; (use-package all-the-icons :ensure t)
;; ;;(use-package drag-stuff :ensure t)

(use-package consult
  :ensure t
  :bind (("M-g M-g" . consult-goto-line)
	 ("C-x b" . consult-buffer)
	 ("C-s"   . consult-line-multi)
	 ("C-S-s" . isearch-forward)
	 ("C-x r b" . consult-bookmark)))
(setq register-preview-delay 0.5
      register-preview-function #'consult-register-format)

(use-package vertico
  :ensure t
  :init
  (vertico-mode)
  (setq vertico-count 10)
  (setq vertico-resize t))

(use-package savehist
  :init
  (savehist-mode))

(use-package marginalia
  :ensure t
  :init
  (marginalia-mode))

(use-package orderless
  :ensure t
  :custom
  (completion-styles . '(orderless basic))
  (completion-category-defaults . nil)
  (completion-category-overrides . '((file (styles . (substring partial-completion fuzzy))))))

;; TODO use corfu with dabbrev
(use-package corfu
  :ensure t
  :custom
  (corfu-auto t)
  (corfu-cycle t)
  (corfu-separator ?\s)
  (corfu-preview-current "insert")
  (corfu-scroll-margin 25)
  :init
  (global-corfu-mode)
    (defun corfu-move-to-minibuffer ()
    (interactive)
    (let ((completion-extra-properties corfu--extra)
          completion-cycle-threshold completion-cycling)
      (apply #'consult-completion-in-region completion-in-region--data)))
  (keymap-set corfu-map "M-m" 'corfu-move-to-minibuffer)
  ;; enable corfu on TAB
  (use-package emacs
    :init
    ;; `completion-at-point' is often bound to M-TAB.
    (setq tab-always-indent 'complete)))

(use-package vterm
  :custom
  (vterm-shell "zsh"))

;; (use-package embark :ensure t)
;; (use-package embark-consult :ensure t)
;; (use-package orderless :ensure t)

;; (use-package which-key :ensure t)
;; (use-package embark :ensure t)
;; (use-package embark-consult :ensure t)
;; (use-package orderless :ensure t)

;; (use-package which-key :ensure t)
;; (use-package git-gutter :ensure t)
;; (use-package git-time-machine :ensure t)
;; (use-package ripgrep :ensure t)
;; (use-package all-the-icons :ensure t)
;; ;;(use-package drag-stuff :ensure t)


;; (use-package git-gutter :ensure t)
;; (use-package git-time-machine :ensure t)
;; (use-package ripgrep :ensure t)
;; (use-package all-the-icons :ensure t)
;; ;;(use-package vterm :ensure t)
;; ;;(use-package drag-stuff :ensure t)


(provide 'aa/packages)
