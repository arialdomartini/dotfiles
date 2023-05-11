(use-package doom-modeline
  :ensure t
  :init (doom-modeline-mode 1)
  :config 
  (setq doom-modeline-buffer-state-icon nil)
  (setq doom-modeline-indent-info t)
  (setq doom-modeline-lsp t))

(provide 'aa-mode-line)
