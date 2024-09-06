;;; init-hdl.el --- I am an "electrical engineer" -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:


;;; Verilog, the main thing in industry and at school.
(use-package verilog-mode
  :ensure t
  :custom
  ((verilog-auto-newline . nil)
   (verilog-case-fold . nil))
  ;; (verilog-auto-arg-sort . t))
  :bind
  (:map verilog-mode-map
        ("M-f" . tofu/verilog-forward-word)
        ("M-b" . tofu/verilog-backward-word))
  :config
  ;; Because it complains about t not being a list
  (setq verilog-auto-arg-sort t)
  ;; This isn't a very smart way of doing it but it works for small educational codebases.
  (add-to-list 'verilog-library-directories "..")
  (add-to-list 'verilog-library-directories "../hdl")

  (defvar tofu/navigation-verilog-mode-syntax-table
    (let ((temp-syntax-table (make-syntax-table verilog-mode-syntax-table)))
      (modify-syntax-entry ?_ "_" temp-syntax-table)
      temp-syntax-table)
    "A syntax table to make Verilog mode actually treat _ correctly.")

  (defun tofu/fix-verilog-syntax ()
    (set-syntax-table tofu/navigation-verilog-mode-syntax-table))

  :hook
  (verilog-mode . tofu/fix-verilog-syntax))

  ;; (defun tofu/verilog-forward-word (&optional arg)
  ;;   (interactive "p")
  ;;   (with-syntax-table tofu/navigation-verilog-mode-syntax-table
  ;;     (forward-word arg)))

  ;; (defun tofu/verilog-backward-word (&optional arg)
  ;;   (interactive "p")
  ;;   (with-syntax-table tofu/navigation-verilog-mode-syntax-table
  ;;     (backward-word arg)))



(use-package verilog-ext
  :ensure t
  :hook ((verilog-mode . verilog-ext-mode))
  :init
  ;; Can also be set through `M-x RET customize-group RET verilog-ext':
  ;; Comment out/remove the ones you do not need
  (setq verilog-ext-feature-list
        '(font-lock
          xref
          capf
          hierarchy
          eglot
          ;; lsp
          flycheck
          beautify
          navigation
          template
          formatter
          compilation
          imenu
          which-func
          hideshow
          typedefs
          time-stamp
          block-end-comments
          ports))
  (setq verilog-ext-tags-backend 'tree-sitter)
  (setq verilog-ts-indent-level 3)
  :config
  (verilog-ext-mode-setup))


;;; FPGA tooling
;; Mainly just used to deal with the abomination that is a Xilinx XDC file...
(use-package fpga
  :ensure t
  :init
  (setq fpga-feature-list '(xilinx)))


(provide 'init-hdl)
;;; init-hdl.el ends here
