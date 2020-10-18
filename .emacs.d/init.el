;; -*- mode: elisp -*-

(tool-bar-mode 0)

;; Emacs package system
; (require 'package)
; (add-to-list 'package-archives
;                          '("melpa" . "https://melpa.org/packages/"))

;; migemo
; (require 'migemo)
; (setq migemo-command "cmigemo")
; (setq migemo-options '("-q" "--emacs"))
; (setq migemo-dictionary
;       "/usr/local/Cellar/cmigemo/20110227/share/migemo/utf-8/migemo-dict")
; (setq migemo-user-dictionary nil)
; (setq migemo-coding-system 'utf-8-unix)
; (setq migemo-regex-dictionary nil)
; (load-library "migemo")
; (migemo-init)

;; skk
; (require 'skk)
; (setq default-input-method "japanese-skk")
; (setq skk-search-katakana t)
; (setq skk-search-katakana 'jisx0201-kana)  ; I like hankaku-kana
; (require 'skk-hint)
; (setq skk-preload t)

;; org-mode configuration
; (require 'org)

;; howm
; (setq howm-menu-lang 'ja)
; (setq howm-directory "~/Dropbox/howm/")
; (setq howm-keyword-file "~/Dropbox/howm/.howm-keys")
; (setq howm-file-name-format "%Y/%m/%Y_%m_%d.txt")
; (setq howm-keyword-case-fold-search t)
; (setq howm-view-split-horizontally t)
; (require 'howm)
