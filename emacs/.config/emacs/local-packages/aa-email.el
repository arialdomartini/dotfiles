(add-to-list 'load-path "/usr/share/emacs/site-lisp/")
(use-package notmuch
  :ensure nil ; because it comes with the `notmuch' from Arch
  :config
  (define-key global-map (kbd "C-c m") #'notmuch)
  (setq notmuch-show-logo nil
	notmuch-search-oldest-first nil
	notmuch-hello-auto-refresh t))

(provide 'aa-email)



