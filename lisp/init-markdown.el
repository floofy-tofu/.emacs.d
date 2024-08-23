;;; init-markdown.el --- Configure markdown mode -*- lexical-binding: t -*-
;;; Commentary:

;;; Code:

(use-package markdown-mode
  :ensure t
  :hook ((markdown-mode . auto-fill-mode))
  :custom
  ;; Syntax highlighting in Markdown (way better than polymode which breaks
  ;; with tree sitter (at least the old 28- version)
  ((markdown-fontify-code-blocks-natively t)))

;; Edit in other windows
(use-package edit-indirect
  :ensure t)


(provide 'init-markdown)

;;; init-markdown.el ends here
