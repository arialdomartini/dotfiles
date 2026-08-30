(setq no-littering-etc-directory
      (expand-file-name "emacs/etc/" (or (getenv "XDG_CACHE_HOME") "~/.cache/")))
(setq no-littering-var-directory
      (expand-file-name "emacs/var/" (or (getenv "XDG_CACHE_HOME") "~/.cache/")))

(load (locate-user-emacs-file "no-littering.el"))
(require 'no-littering)

;; Belt-and-suspenders: force package-user-dir
(setq package-user-dir (no-littering-expand-var-file-name "elpa/"))
(setq package-quickstart-file (no-littering-expand-var-file-name "elpa/package-quickstart.el"))

(when (fboundp 'startup-redirect-eln-cache)
  (startup-redirect-eln-cache
   (convert-standard-filename
    (expand-file-name "eln-cache/" no-littering-var-directory))))



(setq package-enable-at-startup t)
(defun display-startup-echo-area-message ()
  (message ""))
