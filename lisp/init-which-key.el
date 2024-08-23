;;; init-which-key.el --- Install and configure which key -*- lexical-binding: t -*-
;;; Commentary:

;;; Code:

(use-package which-key
  :ensure t
  :init (which-key-mode)
  :diminish which-key-mode
  :config
  (setq which-key-idle-delay 0.5))

(provide 'init-which-key)

;;; init-which-key.el ends here
