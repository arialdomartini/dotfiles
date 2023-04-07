;; _*_ lexical-binding: t _*_

(defun aa/get-packages (path)
  (let ((files (directory-files-recursively path "")))
    (mapcar (lambda (f)
	      (intern
	       (file-name-sans-extension
		(file-relative-name f path))))
	    files)))

(defun aa/require-packages-in (path)
  (let ((packages (aa/get-packages path)))
    (add-to-list 'load-path path)
    (dolist(p packages)
      (require p))))

(aa/require-packages-in
 (expand-file-name "local-packages" user-emacs-directory))







