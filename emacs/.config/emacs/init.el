;; _*_ lexical-binding: t _*_
;; Needed for straight.el, see https://github.com/radian-software/straight.el/blob/master/README.md#getting-started
(setq package-enable-at-startup nil)


;; TODO Not clear where use-package is found
;; TODO Not clear what :noerror is
(require 'use-package nil :noerror)
;; TODO how to make this relative to the directory

(defun aa/install-packages (ps path) 
  (add-to-list 'load-path path)
  (dolist (p ps)
    (require p)))

(aa/install-packages
 '(aa/load-straight
   aa/appearance
   aa/backup
   aa/nativecomp
   aa/packages)
 "~/.config/emacs/local-packages")
