;;; init-treesitter.el --- Configure treesitter -*- lexical-binding: t -*-
;;; Commentary:

;;; Code:
(use-package treesit-auto
  :ensure t
  :if (>= emacs-major-version 29)
  :init
  (setq treesit-auto-langs '(python c cpp cmake bash yaml verilog python json rust)) ; FIXME: make this configured by feature list
  :config
  (treesit-auto-install-all)
  (treesit-auto-add-to-auto-mode-alist 'all)
  (global-treesit-auto-mode))

(provide 'init-treesitter)

;;; init-treesitter.el ends here
