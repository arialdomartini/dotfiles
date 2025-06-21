(use-package expand-region
  :ensure t
  :bind
  ("C-=" . er/expand-region)
  ("C-+" . er/contract-region))

(use-package magit
  :defer t
  :config
  ;; Magit reuses the whole buffer
  (add-to-list 'display-buffer-alist
           '((derived-mode . magit-status-mode)
             (display-buffer-reuse-window display-buffer-same-window)))

  (setq magit-gitk-executable "/usr/bin/gitg"
    magit-repository-directories '(("~/prg/" . 2)))
  (put 'magit-edit-line-commit 'disabled nil))

(use-package forge
  :defer t
  :after magit
  :config
  (setq auth-sources '("~/.authinfo")
    github.user "arialdo.martini@gmail.com"))

;; we stopped here

(use-package git-timemachine
  :bind (("C-c g t" . git-timemachine)))

(use-package embark
  :ensure t
  :bind (("C-." . embark-act)
     ("C-," . embark-dwim)))

(use-package embark-consult
  :ensure t
  :after (embark consult))


(use-package drag-stuff
  :ensure t
  :config
  (drag-stuff-mode)
  (drag-stuff-define-keys)) ;; M-<up/down/left/right>


(use-package vertico
  :ensure t
  :demand t
  :config
  (vertico-mode)
  (vertico-buffer-mode 1)
  (setq vertico-buffer-display-action
        '(display-buffer-full-frame))
  (setq vertico-count 25
        vertico-resize nil)
  (file-name-shadow-mode 1)
  (add-hook 'rfn-eshadow-update-overlay-hook #'vertico-directory-tidy)
  :bind (:map vertico-map
              ("C-j" . vertico-insert)
              ("C-l" . backward-kill-word)))


(setq enable-recursive-minibuffers t)



;; (setq completion-lazy-hilit t)
(use-package consult
  :ensure t
  :demand t
  :bind (("M-g M-g" . consult-goto-line)
         ("M-g <SPC>" . consult-mark)
         ("C-x b" . consult-buffer)
         ("C-s"   . consult-line)
         ("C-S-s" . isearch-forward)
         ("C-x r b" . consult-bookmark)
         ("C-M-y" . consult-yank-pop)
         ("M-y" . consult-yank-from-kill-ring)
         ("C-c r r" . consult-ripgrep)
         ("C-c g g" . consult-git-grep)
         ("C-c f l" . consult-focus-lines)
         ("<XF86Tools>" . consult-outline)
         ("<XF86Launch5>" . consult-imenu))
  :config
  (setq completion-in-region-function #'consult-completion-in-region) ;; instead of corfu
  (setq register-preview-delay 0.5
        register-preview-function #'consult-register-format
        ;;    completion-in-region-function #'consult-completion-in-region
        ;;    tab-always-indent 'complete)
        )
  (consult-customize consult-find consult-fd :state (consult--file-preview)) ;; preview for consult-fd

  (consult-customize
   consult-line
   :add-history (seq-some #'thing-at-point '(region symbol)))

  (defalias 'consult-line-thing-at-point 'consult-line)

  (consult-customize
   consult-line-thing-at-point
   :initial (thing-at-point 'symbol))

  (global-set-key (kbd "M-s .") #'consult-line-thing-at-point)
  (global-set-key (kbd "M-s M-s .") #'isearch-forward-symbol-at-point))


(use-package orderless
  :ensure t
  :config
  (setq completion-styles '(orderless basic))
  (setq completion-category-overrides '((file (styles basic partial-completion)))))


(defun remove-ispell-completion ()
  (remove-hook 'completion-at-point-functions #'ispell-completion-at-point t))

(with-eval-after-load 'text-mode
  (remove-ispell-completion)
  (add-hook 'text-mode-hook #'remove-ispell-completion))

(use-package cape
  :config
  (defun my-cape-add-backends ()
    (add-hook 'completion-at-point-functions #'cape-dabbrev nil 'local)
    (add-hook 'completion-at-point-functions #'cape-file nil 'local))

  (add-hook 'text-mode-hook #'my-cape-add-backends)
  (add-hook 'prog-mode-hook #'my-cape-add-backends))


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


(use-package vterm
  :config
  (setq vterm-ignore-blink-cursor nil)
  :hook (vterm-mode . aa/disable-hl-line-mode)
  :bind (("C-c t" . vterm)
         :map vterm-mode-map
         ("<f1>" . vterm-copy-mode)
         ("M-<left>" . nil) ;; because of tab bar
         ("M-<right>" . nil)
         :map vterm-copy-mode-map
         ("<f1>" . vterm-copy-mode))
  :custom
  (vterm-shell "zsh"))


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

(use-package vundo
  :config
  (setq vundo-glyph-alist vundo-unicode-symbols))

(provide 'aa-packages)
