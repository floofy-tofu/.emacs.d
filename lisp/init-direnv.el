;;; init-direnv.el --- Setup Emacs integration for direnv -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(use-package envrc
  :ensure t
  :hook (elpaca-after-init-hook . envrc-global-mode))

(provide 'init-direnv)
;;; init-direnv.el ends here
