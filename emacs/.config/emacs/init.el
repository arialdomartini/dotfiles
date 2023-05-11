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

;(aa/require-packages-in
; (expand-file-name "local-packages" user-emacs-directory))


(add-to-list 'load-path (locate-user-emacs-file "local-packages"))
(dolist(p '(aa-prelude
	    aa-defaults
	    aa-packages
	    aa-appearance
	    aa-backup
	    aa-dashboard
	    aa-font
	    aa-icons
	    aa-lisp
	    aa-mode-line
	    aa-nativecomp
	    aa-projectile
	    aa-scheme
	    aa-theme
	    aa-windows))
    (require p))





(put 'dired-find-alternate-file 'disabled nil)
