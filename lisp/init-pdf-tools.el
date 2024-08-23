;;; init-pdf-tools.el --- Load pdf-tools -*- lexical-binding: t -*-

;;; Commentary:

;;; Code:

(use-package pdf-tools
  :ensure t
  :config
  (pdf-tools-install t t)) ; This might not work if it isn't installed yet.

(provide 'init-pdf-tools)

;;; init-pdf-tools.el ends here
