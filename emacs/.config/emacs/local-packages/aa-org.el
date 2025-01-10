(use-package org
  :after olivetti
  :defer
  :config

  (defun my--remove-ispell-completion-function ()
    (setq-local completion-at-point-functions (delq 'ispell-completion-at-point completion-at-point-functions)))

  (add-hook 'org-mode-hook #'my--remove-ispell-completion-function)
  (add-hook 'org-mode-hook #'olivetti-mode)
  (add-hook 'org-mode-hook #'auto-fill-mode)
  (setq org-startup-folded 'overview)
  
  (org-babel-do-load-languages
   'org-babel-load-languages
   '((shell . t))))

(provide 'aa-org)


