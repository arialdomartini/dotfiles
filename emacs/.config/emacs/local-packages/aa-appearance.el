(setq inhibit-splash-screen t)
(tool-bar-mode -1)
(menu-bar-mode -1)
(scroll-bar-mode -1)
(horizontal-scroll-bar-mode -1)
(setq blink-cursor -1)
(blink-cursor-mode -1)
(setq help-window-select t)

(use-package hl-line
  :hook (after-init . global-hl-line-mode)
  :config
  (defun aa/disable-hl-line-mode ()
    "Unconditionally disable `hl-line-mode'."
    (setq-local hl-line-mode nil
		global-hl-line-mode nil)
    (global-hl-line-unhighlight)))




(use-package olivetti
  :ensure t)

;; volatile-highlights
(use-package volatile-highlights
  :ensure t
  :config
  (defun aa-volatile-highlights-set-background (_theme)
    (set-face-attribute 'vhl/default-face nil :background (face-attribute 'mode-line :background)))
  (add-hook 'enable-theme-functions 'aa-volatile-highlights-set-background)
  (volatile-highlights-mode t))


(setq-default truncate-lines nil)

(use-package pulsar
  :ensure t
  :config
  (setq pulsar-pulse t
	pulsar-delay 0.055
	pulsar-iterations 10
	pulsar-face 'pulsar-green
	pulsar-highlight-face 'pulsar-yellow)
  (pulsar-global-mode 1))


(use-package rainbow-mode
  :ensure t
  :hook ((prog-mode . rainbow-mode)))


(use-package hi-lock
  :defer t
  :init
  (setq hi-lock-auto-select-face t)
  :config
  (defun hi-lock-unface-dwim ()
    "Remove hi-lock highlighting for the symbol or regex at point, if present."
    (interactive)
    (let ((symbol (find-tag-default-as-symbol-regexp))
          (regexps-at-point (hi-lock--regexps-at-point)))
      (cond
       (regexps-at-point
        (unhighlight-regexp (car regexps-at-point)))
       (symbol
        (hi-lock-unface-buffer symbol))
       (t
        (call-interactively 'unhighlight-regexp)))))
  :bind
  (("M-s h u" . hi-lock-unface-buffer-at-point)))


(provide 'aa-appearance)
