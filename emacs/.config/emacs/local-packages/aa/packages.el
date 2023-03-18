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
;; ;;(use-package vterm :ensure t)
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
  (vertico-mode))

(use-package marginalia
  :ensure t
  :init
  (marginalia-mode))

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
;; ;;(use-package vterm :ensure t)
;; ;;(use-package drag-stuff :ensure t)


;; (use-package git-gutter :ensure t)
;; (use-package git-time-machine :ensure t)
;; (use-package ripgrep :ensure t)
;; (use-package all-the-icons :ensure t)
;; ;;(use-package vterm :ensure t)
;; ;;(use-package drag-stuff :ensure t)


(provide 'aa/packages)
