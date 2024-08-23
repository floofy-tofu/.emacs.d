;;; init-whitespace.el --- Cleanup whitespace -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(use-package whitespace-cleanup-mode
  :ensure t
  :diminish
  :config
  (global-whitespace-cleanup-mode))

(provide 'init-whitespace)

;;; init-whitespace.el ends here
