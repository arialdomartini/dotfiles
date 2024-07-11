(use-package expand-region
  :ensure t
  :bind
  ("C-=" . er/expand-region)
  ("C-+" . er/contract-region))

(use-package magit
  :ensure t
  :config
  (setq magit-gitk-executable "/usr/bin/gitg"
	magit-repository-directories '(("~/prg/" . 2))
	magit-revision-show-gravatars 'author)
  (put 'magit-edit-line-commit 'disabled nil))

(use-package forge
  :ensure t
  :config
  (setq auth-sources '("~/.authinfo")
	github.user "arialdomartini@gmail.com"))

(use-package git-timemachine
  :bind (("C-c g t" . git-timemachine)))

(use-package embark-consult
  :ensure t)

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
  (drag-stuff-mode)
  (drag-stuff-define-keys)) ;; M-<up/down/left/right>



(use-package consult
  :ensure t
  :demand t
  :bind (("M-g M-g" . consult-goto-line)
	 ("C-x b" . consult-buffer)
	 ("C-s"   . consult-line)
	 ("C-S-s" . isearch-forward)
	 ("C-x r b" . consult-bookmark)
	 ("C-c r r" . consult-ripgrep)
         ("M-y" . consult-yank-pop)
	 ("C-c g g" . consult-git-grep))
  :config
  (setq register-preview-delay 0.5
	register-preview-function #'consult-register-format
	;;	completion-in-region-function #'consult-completion-in-region
	;;	tab-always-indent 'complete)
	))


(use-package vertico
  :ensure t
  :demand t
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
  (savehist-mode)
  :config
  (push 'register-alist savehist-additional-variables))

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
  :init
  (global-corfu-mode)
  (defun corfu-move-to-minibuffer ()
    (interactive)
    (let ((completion-extra-properties corfu--extra)
          completion-cycle-threshold completion-cycling)
      (apply #'consult-completion-in-region completion-in-region--data)))
  (keymap-set corfu-map "<tab>" 'corfu-move-to-minibuffer)
  :config
  (setq corfu-min-width 250
        corfu-min-height 750
        corfu-count 20
        corfu-auto t
        corfu-cycle t
        corfu-separator ?\s
        corfu-preview-current "insert"
        corfu-scroll-margin 25
        ;; enable corfu on TAB
        tab-always-indent 'complete
        ;; shows documentation after `corfu-popupinfo-delay'
        corfu-popupinfo-delay '(1.25 . 0.5))
  (corfu-popupinfo-mode 1)

  ;; Sort by input history (no need to modify `corfu-sort-function').
  (with-eval-after-load 'savehist
    (corfu-history-mode 1)
    (add-to-list 'savehist-additional-variables 'corfu-history)) )




(use-package vterm
  :after hl-line
  :custom
  (vterm-shell "zsh")
  :config
  (global-set-key (kbd "C-c t") 'vterm)
  (setq vterm-ignore-blink-cursor nil)
  (add-hook 'vterm-mode-hook  #'aa/disable-hl-line-mode))

(use-package markdown-mode
  :ensure t
  :after olivetti
  :config
  (add-hook 'markdown-mode-hook #'olivetti-mode)
  (add-hook 'markdown-mode-hook #'auto-fill-mode))

(use-package markdown-toc
  :ensure t)


(use-package restclient
  :ensure t)

(use-package lorem-ipsum
  :ensure t)

(provide 'aa-packages)
