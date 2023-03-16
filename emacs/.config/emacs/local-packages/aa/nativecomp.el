;; Native comp
(setq
 native-comp-speed 3
 comp-speed 3)
;;; Speed up boot time by increasing GC thresholds during startup only
(setq
 gc-cons-threshold (* 64 1024 )
 gc-cons-percentage 0.6)
(add-hook 'emacs-startup-hook
          (lambda ()
            (setq gc-cons-threshold (* 64 1024 1024)
		  gc-cons-percentage 0.1)))
(setq native-comp-async-report-warnings-errors nil
      comp-async-report-warning-errors nil)


(provide 'aa/nativecomp)
