;;; init-yas.el --- Configure yasnippet -*- lexical-binding: t; -*-
;;; Commentary:

;;; Code:

(use-package yasnippet
  :ensure t
  :config
  (setq yas-snippet-dirs (cons (concat user-emacs-directory "my-snippets")
			       yas-snippet-dirs))
  :hook
  (prog-mode . yas-minor-mode)
  :bind
  (("C-c s" . yas-insert-snippet)))


(use-package yasnippet-snippets
  :ensure t)

(use-package consult-yasnippet
  :ensure t
  :bind
  (("C-c y" . consult-yasnippet)))

(use-package yasnippet-capf
  :ensure t
  :after cape
  :config
  (add-hook 'completion-at-point-functions #'yasnippet-capf))

(provide 'init-yas)
;;; init-yas.el ends here
