;;; init-yas.el --- Configure yasnippet -*- lexical-binding: t; -*-
;;; Commentary:

;;; Code:

(use-package yasnippet
  :ensure t
  :config
  (setq yas-snippet-dirs (cons (concat user-emacs-directory "my-snippets")
			       yas-snippet-dirs))

  (define-key yas-minor-mode-map (kbd "<tab>") nil)
  (define-key yas-minor-mode-map (kbd "TAB") nil)
  
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
  :after cape)

(provide 'init-yas)
;;; init-yas.el ends here
