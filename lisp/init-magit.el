;;; init-magit.el --- It's Magit! -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

;; Install the latest version so Magit is happy
(use-package transient
  :ensure t)

(use-package magit
  :ensure t
  :bind
  (("C-x g" . magit-status)
   ("C-x p m" . magit-project-status)))

(provide 'init-magit)

;;; init-magit.el ends here
