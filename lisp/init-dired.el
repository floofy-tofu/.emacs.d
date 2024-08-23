;;; init-dired.el --- Configure dired -*- lexical-binding: t -*-

;;; Commentary:


;;; Code:

(use-package dired
  :ensure nil
  :bind (("C-c j" . dired-jump))
  ;; Disable dired single because it makes dired over TRAMP unbearable
  ;; :map dired-mode-map ; Let's not repeat not being able to type b...
  ;; ("f" . dired-single-buffer)
  ;; ("b" . dired-single-up-directory)
  ;; ("h" . dired-hide-dotfiles-mode)
  ;; ("<RET>" . dired-single-buffer))
  :custom ((dired-listing-switches "-alh --group-directories-first")))

(use-package diredfl
  :ensure t
  :config (diredfl-global-mode))

(provide 'init-dired)

;;; init-dired.el ends here
