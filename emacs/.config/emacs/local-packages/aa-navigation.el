(defun aa-forward-down-list ()
  "Move forward out of one level of parentheses."
  (interactive)
  (backward-up-list -1))
(define-key global-map (kbd "C-M-d") #'aa-forward-down-list)

(provide 'aa-navigation)
