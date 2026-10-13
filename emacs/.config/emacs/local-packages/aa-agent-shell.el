;; -*- lexical-binding: t; -*-
(use-package agent-shell
  :ensure t
  :init
  (let ((opencode-dir "/usr/sbin"))
    (add-to-list 'exec-path (expand-file-name opencode-dir))
    (setenv "PATH"
            (concat opencode-dir path-separator (getenv "PATH"))))
  
  :custom
  ;; Aprire l'interfaccia "viewport" invece della shell (opzionale)
  (agent-shell-prefer-viewport-interaction nil)
  :config
  ;; Passa a opencode l'ambiente di Emacs (PATH, HOME, ecc.)
  (setq agent-shell-opencode-environment
        (agent-shell-make-environment-variables :inherit-env t))
  :bind
  (("C-c a a" . agent-shell-opencode-start-agent)
   ("C-c a A" . agent-shell)
   :map agent-shell-mode-map
   ("<return>" . newline)
   ("C-<return>" . agent-shell-submit)))

(provide 'aa-agent-shell)
