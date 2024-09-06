;;; init-indent-guides.el --- Configure the indent guides package. -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

;; TODO: Potentially navigate to this tree-sitter enabled package instead: https://github.com/jdtsmith/indent-bars

(use-package highlight-indent-guides
  :ensure t
  :custom
  (highlight-indent-guides-responsive 'top)
  (highlight-indent-guides-method 'character)
  :hook
  (prog-mode . highlight-indent-guides-mode)
  (yaml-mode . highlight-indent-guides-mode)
  (yaml-ts-mode . highlight-indent-guides-mode)
  (ledger-mode . highlight-indent-guides-mode))


(provide 'init-indent-guides)

;;; init-indent-guides.el ends here
