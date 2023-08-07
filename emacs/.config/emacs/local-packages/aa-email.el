(add-to-list 'load-path "/usr/share/emacs/site-lisp/") ; `notmuch', as provided by Arch
(use-package notmuch
  :ensure nil ; because it comes with the `notmuch' from Arch
  :config
  (define-key global-map (kbd "C-c m") #'notmuch)
  (setq notmuch-show-logo nil
	notmuch-search-oldest-first nil
	notmuch-hello-auto-refresh t

        notmuch-column-control 1.0
        notmuch-hello-auto-refresh t
        notmuch-hello-recent-searches-max 20
        notmuch-hello-thousands-separator ""
        notmuch-hello-sections '(notmuch-hello-insert-saved-searches)
        notmuch-show-all-tags-list t


	notmuch-search-oldest-first nil
        notmuch-search-result-format
        '(("date" . "%12s  ")
          ("count" . "%-7s  ")
          ("authors" . "%-20s  ")
          ("subject" . "%-80s  ")
          ("tags" . "(%s)"))
        notmuch-tree-result-format
        '(("date" . "%12s  ")
          ("authors" . "%-20s  ")
          ((("tree" . "%s")
            ("subject" . "%s"))
           . " %-80s  ")
          ("tags" . "(%s)"))
        notmuch-search-line-faces
        '(("unread" . notmuch-search-unread-face)
          ("flag" . italic))
        notmuch-show-empty-saved-searches t
        notmuch-saved-searches
        `(( :name "💬 unread (inbox)"
            :query "tag:unread and tag:inbox"
            :sort-order newest-first
            :key ,(kbd "u"))
          ( :name "📥 inbox"
            :query "tag:inbox"
            :sort-order newest-first
            :key ,(kbd "i"))
	  ( :name "😸 all"
            :query "*"
            :sort-order newest-first
            :key ,(kbd "a")))))



(provide 'aa-email)
