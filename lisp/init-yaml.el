;;; init-yaml.el --- Configure ability to read YAML docs -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(use-package yaml-mode
  :ensure t
  :if (not (treesit-available-p)))

(provide 'init-yaml)
;;; init-yaml.el ends here
