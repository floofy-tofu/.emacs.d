;;; init-writing-utils.el --- Tools for writing language, not code -*- lexical-binding: t; -*-
;;; Commentary:

;;; Code:

(use-package visual-fill-column
  :ensure t
  :custom
  (visual-fill-column fill-column)
  (visual-fill-column-enable-sensible-window-split t)
  :hook
  (text-mode . visual-fill-column-mode)
  (visual-fill-column-mode . visual-line-mode))

;;; init-writing-utils.el ends here
