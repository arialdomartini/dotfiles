;; _*_ lexical-binding: t _*_

;; TODO how to make this relative to the directory
(defun aa/require-local-packages (ps path) 
  (add-to-list 'load-path path)
  (dolist (p ps)
    (require p)))

;; TODO how to read from directory content
(aa/require-local-packages
 '(aa/prelude
   aa/defaults
   aa/nativecomp
   aa/appearance
   aa/backup
   aa/packages)
 "~/.config/emacs/local-packages")
