;;; init.el --- floofy-tofu's Emacs config -*- lexical-binding: t; -*-
;;; Commentary:
;; Setup and configure Emacs. I determined that I think the literate config is actually a
;; detriment to readability. This is a 2024 rewrite of a config I have tweaked continuously since 2016.

;;; Code:

;; All files of this config go in the following folder
(add-to-list 'load-path (concat user-emacs-directory "lisp"))
(require 'tofu-useful-functions)


;;; Vanilla Emacs features:
;; These are features that will actually drive me insane if they aren't enabled.
(require 'init-vanilla-emacs)
(require 'enable-disabled-commands)

(require 'cl-lib)
(cl-case system-type
  (gnu-linux  (require 'init-linux))
  (darwin     (require 'init-osx))
  (windows-nt (require 'init-windows)))


;;; Profiling:

;; Just show time to load config
;; FIXME: once again, change what hook is used if we are using elpacca or not
(defun +profile-init ()
  "Message time it took to load Emacs.
This is only accurate if run on the hook."
  (let ((final-time (current-time)))
    (run-with-idle-timer
     2 nil
     (lambda ()
       (message "Emacs loaded in %s with %d garbage collections."
                (format "%.2f seconds"
                        (float-time
                         (time-subtract final-time before-init-time)))
                gcs-done)))))

(add-hook 'elpaca-after-init-hook
          '+profile-init)

;; Actually run profiling
;; (profiler-start 'cpu+mem)
;; (add-hook 'elpaca-after-init-hook (lambda () (profiler-stop) (profiler-report)))


;;; Package managemet:
;; FIXME: setup to either use elpaca or a local elpa exported from elpaca (corporate firewall nonsense)
(require 'init-elpaca)


;;; Themes
(require 'init-themes)

;; Disabled because the built-in solution is stupid and only does 1 page at a time.
;; (require 'init-smooth-scroll)

(require 'init-fonts-ligatures)


;;; Completions
(require 'init-completions)

;; Eglot/lsp is great because it means a lot of modes don't even need any config at all (like Python)
(require 'init-eglot)


;;; Utilities

(require 'init-org)

;; FIXME: TRAMP (sad puppy whine)


(require 'init-magit)
(require 'init-pass)
(require 'init-helpful)
(require 'init-page-break-lines)
(require 'init-dired)
(require 'init-beacon)
(require 'init-pdf-tools)

;; FIXME: vdiff
(require 'init-whitespace)
(require 'init-which-key)

(require 'init-eldoc)
(require 'init-rainbow-delimiters)
(require 'init-yas)
;; license headers? (maybe there is a yas for that)
;; FIXME: auto formatting
;; FIXME: folding
(require 'init-breadcrumb)

(require 'init-direnv)

(require 'init-indent-guides)

;; Finances
(require 'init-ledger)

;; Email
;; Uses loads in a directory out of the git repo for security reasons.
(when (file-exists-p "~/mail-config/email-config.el")
  (load "~/mail-config/email-config.el"))

;; FIXME: find a new modeline that doesn't suck


;;; Writing
;; FIXME: org
;; FIXME: autosnippets for LaTeX
;; FIXME: spellchek
;; (require 'init-spellcheck)

(require 'init-markdown)
;; LaTeX


;;; Languages

;; FIXME: Have an easy way configure this locally for what is needed
(require 'init-treesitter)

(require 'init-lisps)
(require 'init-c)
(require 'init-hdl)
(require 'init-yaml)

;; For modes that really don't need anything but to use an existing mode
(if (treesit-available-p)
    (add-to-list 'auto-mode-alist '("\\.ino\\'" . c++-ts-mode))
  (add-to-list 'auto-mode-alist '("\\.ino\\'" . c++-mode)))
(add-to-list 'auto-mode-alist '("\\PKGBUILD\\'" . sh-mode)) ; arch moment



;; Local Variables:
;; no-byte-compile: t
;; no-native-compile: t
;; no-update-autoloads: t
;; End:
;;; init.el ends here
