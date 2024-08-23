;;; init-themes.el --- Install themes -*- lexical-binding: t; -*-
;;; Commentary:
;; idk what's Linux specific becaue it's my main

;;; Code:

(setq custom-safe-themes t) ; Trust all themes

(use-package catppuccin-theme
  :ensure t
  :config
  (setq catppuccin-flavor 'latte)
  ;; (setq catppuccin-flavor 'frappe) ; Dark
  (load-theme 'catppuccin :no-confirm))

(provide 'init-themes)
;;; init-themes.el ends here
