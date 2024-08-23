;;; init-pass.el --- Configure Emacs integration with the password store -*- lexical-binding: t; -*-
;;; Commentary:
;; Both auth source and a UI

;;; Code:
(use-package auth-source-pass
  :ensure nil
  :init (auth-source-pass-enable)
  :config
  (setq auth-sources '(password-store)))

;; Temp disabled because it can't figure out dependencies probably a skill issue on my behalf
;; (use-package pass
;;   :ensure t)

(require 'epa-file)

(provide 'init-pass)
;;; init-pass.el ends here
