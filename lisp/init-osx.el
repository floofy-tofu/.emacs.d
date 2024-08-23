;;; init-osx.el --- OSx specific settings -*- lexical-binding: t; -*-
;;; Commentary:

;;; Code:

;; Fix the keyboard (muscle memory go brrr)
(setq mac-command-modifier 'meta
      mac-option-modifier 'super
      mac-control-modifier 'control
      ns-function-modifier 'hyper)

;; GUI settings
(menu-bar-mode t) ; The only GUI that makes menu bars not suck.

(provide 'init-osx)
;;; init-osx.el ends here
