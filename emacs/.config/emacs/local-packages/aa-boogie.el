(use-package boogie-friends
  :custom
  (flycheck-dafny-executable "/usr/bin/dafny")
  (dafny-prover-args '("verify"))
  (dafny-prover-background-args '("--verification-time-limit" "10"))
  ;; Manual verification (C-c C-c)
  (dafny-prover-foreground-args '("--use-basename-for-filename"
                                  "--verification-time-limit" "30"
                                  "--cores" "4"
                                  "--show-snippets" "true"))
  ;; With prefix arg (C-u C-c C-c) will compile
  (dafny-prover-alternate-args '("--no-verify"))
  :config
  (setq boogie-friends-profiler-timeout 4)
  :bind (("C-c k" . switch-window-then-kill-buffer)))

(provide 'aa-boogie)
