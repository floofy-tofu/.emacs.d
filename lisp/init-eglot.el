;;; init-eglot.el --- Configure eglot -*- lexical-binding: t -*-
;;; Commentary:

;;; Code:
;; (use-package elgot)

(use-package eglot-booster
  :ensure (:host github :repo "jdtsmith/eglot-booster")
  :after eglot
  :config
  (eglot-booster-mode))

(provide 'init-eglot)

;;; init-eglot.el ends here
