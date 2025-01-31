;;; init-rust.el --- Initialize Rust -*- lexical-binding: t; -*-
;;; Commentary:

;;; Code:

(use-package rust-mode
  :ensure t
  :init
  (setq rust-mode-treesitter-derive t))

;;; init-rust.el ends here
