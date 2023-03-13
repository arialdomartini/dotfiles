;; _*_ lexical-binding: t _*_
;; Needed for straight.el, see https://github.com/radian-software/straight.el/blob/master/README.md#getting-started
(setq package-enable-at-startup nil)


(add-to-list 'load-path "~/.config/emacs/my-packages")
(load "appearance.el")
(load "backup.el")
(load "nativecomp.el")
(load "straight.el")



(put 'dired-find-alternate-file 'disabled nil)
