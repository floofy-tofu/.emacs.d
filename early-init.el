;;; early-init.el --- Early init file -*- lexical-binding: t; -*-
;;; Commentary:
;; Because we want to disalbe package at startup.

;;; Code:

;; Note, what would be awesome is if I wrote a macro or function like
;; (setq-revert-post-init
;;   foo bar
;;   faz bear)
;; which sets variables but then resets them after init with the hook
;; or something like (setq-revert-on-hook 'hook var val)

;;; Required settings
(setq package-enable-at-startup nil)
(setq inhibit-default-init nil)
(setq native-comp-async-report-warnings-errors nil
      native-comp-jit-compilation t) ; Note: 29.1+

;;; Speeding up init
;; (Most of this is taken from https://github.com/progfolio/.emacs.d)

;; Disable magic files on init
(defvar default-file-name-handler-alist file-name-handler-alist)
(setq file-name-handler-alist nil)

;; It is a known fact that disabling GC for init and re-enabling speeds up init greatly
(setq gc-cons-threshold most-positive-fixnum
      gc-cons-percentage 1)

;; Elpacca maintainer, this is very clever of you
(defun +gc-after-focus-change ()
  "Run GC when frame loses focus."
  (run-with-idle-timer
   5 nil
   (lambda () (unless (frame-focus-state) (garbage-collect)))))


;; Wouldn't need to exist if I wrote my awesome macro
(defun +reset-init-values ()
  "Reset initial values of variables after init."
  (run-with-idle-timer
   1 nil
   (lambda ()
     (setq file-name-handler-alist default-file-name-handler-alist
           gc-cons-percentage 0.1
           gc-cons-threshold 100000000)
     (message "gc-cons-threshold & file-name-handler-alist restored")
     (when (boundp 'after-focus-change-function)
       (add-function :after after-focus-change-function #'+gc-after-focus-change)))))

;; FIXME: make it switch to after-init-hook if elpacca is not used
(with-eval-after-load 'elpaca
  (add-hook 'elpaca-after-init-hook '+reset-init-values))


(provide 'early-init)
;; Local Variables:
;; no-byte-compile: t
;; no-native-compile: t
;; no-update-autoloads: t
;; End:
;;; early-init.el ends here
