(use-package org
  :ensure t
  :after olivetti
  :config
  (add-hook 'org-mode-hook #'olivetti-mode))

(provide 'aa-org)
