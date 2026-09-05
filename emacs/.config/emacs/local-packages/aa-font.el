(set-frame-font "PragmataPro Liga 22" nil t)
;;(set-frame-font "Pragmasevka Nerd Font 22" nil t)
;;(setq-default line-spacing 0.0)
;; (set-frame-font "Victor Mono 16" nil t)

;;(set-frame-font "Monoid 14" nil t)
;;(set-frame-font "Iosevka 18" nil t)
;;(set-frame-font "Cascadia Code 18" nil t)


;; curiusly, this works for Monoid 18 too
(use-package ligature-pragmatapro :ensure t)
(ligature-pragmatapro-setup)
(global-ligature-mode)

(provide 'aa-font)
