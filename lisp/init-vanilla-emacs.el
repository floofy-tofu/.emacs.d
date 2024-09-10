;;; init-vanilla-emacs.el --- Configure Emacs settings before packages installed -*- lexical-binding: t; -*-
;;; Commentary:

;;; Code:


;;; Essential keybindings I need before anything is installed:
(global-set-key (kbd "M-o") #'other-window)
(global-set-key (kbd "C-z") nil)
(global-set-key (kbd "C-c c") #'comment-or-uncomment-region)


;;; UI tweaks
;; Show column numbers
(column-number-mode)

;; Startup screen
(setq inhibit-startup-message t
      inhibit-splash-screen t)
;; Mouse dialogs
(setq use-file-dialog nil
      use-dialog-box nil)
;; Windows
(setq-default frame-resize-pixelwise) t ; Tiling WM moment

;; Bars
(tool-bar-mode -1)
(menu-bar-mode -1) ; Change this if we are on a mac but that will have a specific file.
;; Terminal bell
(setq ring-bell-function #'ignore)
;; Exiting
(setq confirm-kill-emacs 'y-or-n-p)
(setq use-short-answers t)


;;; Editing behavior
(setq tab-always-indent 'complete)
(setq-default indent-tabs-mode nil)
(setq-default sentence-end-double-space nil)
(setq-default fill-column 90)
(setq kill-ring-max 512)


;;; Scrolling
;; Make scrolling half a page
(defun tofu/half-page-scroll-advice (orig-fun &rest args)
  "Get number of lines in half a page to make scrolling not suck."
  (let ((next-screen-context-lines
         (max 1 (floor (window-screen-lines) 2))))
    (apply orig-fun args)))

(advice-add
 #'scroll-up-command
 :around
 #'tofu/half-page-scroll-advice)
(advice-add
 #'scroll-down-command
 :around
 #'tofu/half-page-scroll-advice)


;;; Operating system behavior
(setq large-file-warning-threshold nil)
(setq create-lockfiles nil)


;;; Backups and lockfiles
(setq-default backup-by-copying t
              backup-directory-alist `(("." . ,(concat user-emacs-directory "backups"))))

(setq-default create-lockfiles nil)


;; Put custmize crap in another file
(setq-default custom-file "")


(provide 'init-vanilla-emacs)
;;; init-vanilla-emacs.el ends here
