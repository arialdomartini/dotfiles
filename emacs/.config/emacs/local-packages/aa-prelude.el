(require 'package)
;; TODO it seems not to have effect
(setq use-package-always-ensure t)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))

;; TODO how to prevent this for loading all the times?
;; (unless package-archive-contents
;;  (package-refresh-contents))

(provide 'aa-prelude)
