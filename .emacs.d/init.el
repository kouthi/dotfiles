;; -*- mode: elisp -*-
(setq display-time-24hr-format t)
(display-time)
(column-number-mode t)
;; Emacs package system
(require 'package)
(package-initialize)
(require 'cask "~/.emacs.d/.cask/24.5.1/elpa/cask-20151123.528/cask.el")
(cask-initialize)
;; Disable the splash screen
(setq inhibit-splash-screen t)
;; Enable transient mark mode
(transient-mark-mode 1)
(require 'exec-path-from-shell)
(exec-path-from-shell-initialize)
;; (let ((envs '("PATH" "VIRTUAL_ENV" )))
  ;; (exec-path-from-shell-copy-envs envs))
;; Change backup location
;; (make ~/.emacs.d/backup by hand)
(add-to-list 'backup-directory-alist
  (cons (expand-file-name "~/") (expand-file-name "~/.emacs.d/backup")))
(setq auto-save-file-name-transforms
      `((".*", (expand-file-name "~/.emacs.d/backup/") t)))
(setq auto-save-list-file-prefix "~/.emacs.d/backup/")
;; Indent setting
(setq-default tab-width 2
              indent-tabs-mode nil)
;; Genocide scrollbar
(setq scroll-step 1)
(set-scroll-bar-mode nil)
;; filling setting
(setq fill-column 78)
;; migemo setting
(require 'migemo)
(setq migemo-command "cmigemo")
(setq migemo-options '("-q" "--emacs"))
(setq migemo-dictionary
      "/usr/local/Cellar/cmigemo/20110227/share/migemo/utf-8/migemo-dict")
(setq migemo-user-dictionary nil)
(setq migemo-coding-system 'utf-8-unix)
(setq migemo-regex-dictionary nil)
(load-library "migemo")
(migemo-init)
;; skk
(require 'skk)
(setq default-input-method "japanese-skk")
(setq skk-search-katakana t)
(setq skk-search-katakana 'jisx0201-kana)  ; I like hankaku-kana
(require 'skk-hint)
;;scroll
(require 'smooth-scrolling)
(setq smooth-scroll-mode 1)
;; 2016-12-11
(load-theme 'leuven t)
;;;; org-mode configuration
;; Enable org-mode
;; (require 'org)
;; Mark org-mode work with files ending in .org
;; (add-to-list 'auto-mode-alist '("\\.org$" . org-mode))
;; The above is the default in recent emacsen
(setq org-goto-auto-isearch nil)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(initial-frame-alist
   (quote
    ((vertical-scroll-bars)
     (width . 170)
     (top . 23)
     (left . 35)
     (height . 48)))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
;; eshell japanese
(prefer-coding-system 'utf-8)
;; 2016-08-21
(set-face-attribute 'default nil 
                    :family "Ricty" 
                    :height 140)
;; 2016-11-23
(tool-bar-mode 0)
