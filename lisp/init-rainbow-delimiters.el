;;; init-rainbow-delimiters.el --- Setup rainbow delimiters -*- lexical-binding: t -*-
;;; Commentary:

;;; Code:

(use-package rainbow-delimiters
  :ensure t
  :custom
  (rainbow-delimiters-max-face-count 9)
  :hook
  ((prog-mode . rainbow-delimiters-mode)))

(provide 'init-rainbow-delimiters)

;;; init-rainbow-delimiters.el ends here
