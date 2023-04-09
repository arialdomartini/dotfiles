;(set-frame-font "PragmataPro Liga 18" nil t)
(set-frame-font "Monoid 18" nil t)
;(set-frame-font "Iosevka 18" nil t)
;(set-frame-font "Cascadia Code 18" nil t)



;; curiusly, this works for Monoid 18 too
(use-package ligature-pragmatapro :ensure t)
(ligature-pragmatapro-setup)
(global-ligature-mode)

(provide 'aa/font)
