(use-package org
  :after olivetti
  :defer
  :config
  (add-hook 'org-mode-hook #'olivetti-mode)
  (add-hook 'org-mode-hook #'auto-fill-mode)

  (org-babel-do-load-languages
   'org-babel-load-languages
   '((shell . t))))

(provide 'aa-org)
