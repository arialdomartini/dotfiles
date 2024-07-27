(use-package org
  :after olivetti
  :config
  (add-hook 'org-mode-hook #'olivetti-mode)
  (add-hook 'org-mode-hook #'auto-fill-mode))

(provide 'aa-org)
