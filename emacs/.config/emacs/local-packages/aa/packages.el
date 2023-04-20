(use-package expand-region
  :ensure t
  :bind ("C-=" . er/expand-region))

(use-package magit :ensure t)

(use-package git-timemachine
  :bind (("C-c g t" . git-timemachine)))

(use-package embark
  :ensure t
  :bind (("C-." . embark-act)
	 ("C-," . embark-dwim)))


(use-package which-key
  :ensure t
  :config
  (which-key-mode t))

(use-package drag-stuff
  :ensure t
  :config
  (drag-stuff-define-keys)) ;; M-<up/down/left/right>


(use-package consult
  :ensure t
  :bind (("M-g M-g" . consult-goto-line)
	 ("C-x b" . consult-buffer)
	 ("C-s"   . consult-line)
	 ("C-S-s" . isearch-forward)
	 ("C-x r b" . consult-bookmark)))
(setq register-preview-delay 0.5
      register-preview-function #'consult-register-format)

(use-package vertico
  :ensure t
  :config
  (vertico-mode)
  (setq vertico-count 10
	vertico-resize nil)
  (file-name-shadow-mode 1)
  (add-hook 'rfn-eshadow-update-overlay-hook #'vertico-directory-tidy) 
  :bind (:map vertico-map
              ("C-j" . vertico-insert)
              ("C-l" . backward-kill-word)))

(setq enable-recursive-minibuffers t)


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
  (completion-styles '(orderless basic))
  (completion-category-defaults . nil)
  (completion-category-overrides '((file (styles substring basic partial-completion)))))
  

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
  :after hl-line
  :custom
  (vterm-shell "zsh")
  :hook (vterm-mode . aa/disable-hl-line-mode))

(provide 'aa/packages)
