(setq treesit-language-source-alist
      '((javascript . ("https://github.com/tree-sitter/tree-sitter-javascript"))
        (markdown . ("https://github.com/tree-sitter-grammars/tree-sitter-markdown" "split_parser" "tree-sitter-markdown/src"))
        (fsharp . ("https://github.com/ionide/tree-sitter-fsharp.git" nil "fsharp/src"))
        (haskell . ("https://github.com/tree-sitter/tree-sitter-haskell" nil "src"))))

(use-package treesit-auto
  :custom
  (treesit-auto-install 'prompt)
  :config
  (treesit-auto-add-to-auto-mode-alist 'all)
  (global-treesit-auto-mode))


;; (treesit-install-language-grammar 'fsharp)
;; (treesit-install-language-grammar 'markdown)
;; (treesit-install-language-grammar 'haskell)



(provide 'aa-treesitter)
