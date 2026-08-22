(use-package diredc
  :vc ( :url "https://github.com/Boruch-Baum/emacs-diredc"
        :rev "single-frame")
  :config
  (setq diredc-make-new-frame nil))


(use-package dired-subtree
  :bind
  (("TAB" . dired-subtree-toggle)))


(provide 'aa-dired)
