;;; init-helpful.el --- Install and configure Helpful -*- lexical-binding: t; -*-
;;; Commentary:

;;; Code:
(use-package helpful
  :ensure t
  :defer t
  :bind
  ([remap describe-function] . helpful-callable)
  ([remap describe-command] . helpful-command)
  ([remap describe-variable] . helpful-variable)
  ([remap describe-key] . helpful-key))

(provide 'init-helpful)
;;; init-helpful.el ends here
