;;; init-c.el --- Configure C programming -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(use-package cc-mode
  :ensure nil
  :init
  (defconst tofu-c-style
    '("gnu"
      (c-basic-offset . 4)
      (c-offsets-alist . ((innamespace . [0])))))
  ;; (case-label . +)))))
  (c-add-style "tofu" tofu-c-style)
  (setq c-default-style '((java-mode . "java")
                          (awk-mode . "awk")
                          (other . "tofu")))
  :bind
  (:map c-mode-base-map
        ;; Why does it rebind that?
        ("<tab>" . indent-for-tab-command)))

(use-package c-ts-mode
  :ensure nil
  :custom
  (c-ts-mode-indent-style 'linux)
  (c-ts-mode-indent-offset  4))

(provide 'init-c)

;;; init-c.el ends here
