;; _*_ lexical-binding: t _*_

(load (locate-user-emacs-file "aa-prelude.el"))


(defun aa-get-packages (path)
  (let* ((reg
          (concat
           "\\`"   ; beginning of line
           "[^#]"  ; not #
           ".*"    ; any char
           "\\.el" ; .el extension
           "\\'"))  ; end of string
         (files (directory-files-recursively path reg)))
    (mapcar (lambda (f)
	      (intern
	       (file-name-sans-extension
	        (file-relative-name f path))))
	    files)))

(defun aa-require-packages-in (path)
  (let ((packages (aa-get-packages path)))
    (add-to-list 'load-path path)
    (dolist(p packages)
      (require p))))


(aa-require-packages-in (locate-user-emacs-file "local-packages"))
