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
;; No prompt when quitting ediff
;; https://emacs.stackexchange.com/questions/9322/how-can-i-quit-ediff-immediately-without-having-to-type-y
(defun disable-y-or-n-p (orig-fun &rest args)
  (cl-letf (((symbol-function 'y-or-n-p) (lambda (prompt) t)))
    (apply orig-fun args)))

(advice-add 'ediff-quit :around #'disable-y-or-n-p)

(after! keycast
  (define-minor-mode keycast-mode
    "Show current command and its key binding in the mode line."
    :global t
    (if keycast-mode
        (add-hook 'pre-command-hook 'keycast--update t)
      (remove-hook 'pre-command-hook 'keycast--update))))
(add-to-list 'global-mode-string '("" keycast-mode-line))
(require 'keycast)
