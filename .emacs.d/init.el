(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes '(leuven))
 '(inhibit-startup-screen t)
 '(make-backup-files nil)
 '(setq leuven-scale-outline-headlines))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 (if (string-match "IO" (system-name))
     '(default ((t (:family "HackGenNerd Console" :foundry "PfEd" :slant normal :weight normal :height 241 :width normal))))
   '(default ((t (:family "HackGenNerd Console" :foundry "PfEd" :slant normal :weight normal :height 121 :width normal))))))
