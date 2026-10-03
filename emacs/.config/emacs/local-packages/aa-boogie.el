(use-package boogie-friends
  :custom
  (flycheck-dafny-executable "/usr/bin/dafny")
  ;; (flycheck-boogie-executable "~/tools/boogie/Boogie") ;
  :config
  (setq boogie-friends-profiler-timeout 4))

(provide 'aa-boogie)
