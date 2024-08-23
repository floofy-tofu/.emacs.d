;;; init-lisps.el --- Configure lisp languages -*- lexical-binding: t -*-
;;; Commentary:

;;; Code:

(use-package parinfer-rust-mode
  :ensure t
  ;; Only install on compatible architectures
  :diminish
  :custom
  (parinfer-rust-dim-parens nil) ;; Disable as to not break src exports
  ;; (parinfer-rust-auto-download t)
  :hook
  emacs-lisp-mode
  lisp-data-mode
  lisp-mode)

(add-hook 'emacs-lisp-mode-hook #'flymake-mode)

(provide 'init-lisps)

;;; init-lisps.el ends here
