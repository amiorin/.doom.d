;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

(setq user-full-name "Alberto Miorin"
      user-mail-address "32617+amiorin@users.noreply.github.com")

(setq doom-theme 'doom-one)

(setq display-line-numbers-type 'relative)

(setq org-directory "~/org/")

;; don't prompt before exiting
(setq confirm-kill-emacs nil)
;; don't prompt the first time we start vterm
(setq vterm-always-compile-module t)
;; shortcut to start deer
(evil-global-set-key 'normal "-" 'deer)
;; When done with this frame, type SPC q f`?
(setq server-client-instructions nil)
;; No prompt
(map! :leader
      :desc "Delete frame" "q f" #'delete-frame)
