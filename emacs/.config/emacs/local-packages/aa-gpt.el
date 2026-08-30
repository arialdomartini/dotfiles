(let ((gemini-apikey-file (locate-user-emacs-file "gemini-apikey")))
  (when (file-exists-p gemini-apikey-file)


    (let ((gemini-api-key (with-temp-buffer
                            (insert-file-contents gemini-apikey-file)
                            (buffer-string))))
      (setenv "GEMINI_API_KEY" (string-trim gemini-api-key)))


    (use-package chatgpt-shell
      :defer t
      :custom
      ((chatgpt-shell-google-key
        (lambda ()
          (getenv "GEMINI_API_KEY"))))
      :config
      (setq chatgpt-shell-model-version "gemini-2.5-flash")
      :bind (:map chatgpt-shell-mode-map
                  ("<return>" . newline)
                  ("C-<return>" . chatgpt-shell-submit)))



    (use-package minuet
      :bind
      (("<f1> C-M-i" . #'minuet-complete-with-minibuffer) ;; use minibuffer for completion
       ("<f1> C-M-s-i" . #'minuet-show-suggestion) ;; use overlay for completion
       :map minuet-active-mode-map
       ("M-p" . #'minuet-previous-suggestion)
       ("M-n" . #'minuet-next-suggestion)
       ("M-A" . #'minuet-accept-suggestion)
       ;; Accept the first line of completion, or N lines with a numeric-prefix:
       ;; e.g. C-u 2 M-a will accepts 2 lines of completion.
       ("M-a" . #'minuet-accept-suggestion-line)
       ("M-e" . #'minuet-dismiss-suggestion))
      :config
      (setq minuet-provider 'gemini)
      (minuet-set-optional-options minuet-openai-fim-compatible-options :max_tokens 64))))




(provide 'aa-gpt)
