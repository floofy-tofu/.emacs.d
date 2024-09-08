;;; init-ledger.el --- Install and configure hledger -*- lexical-binding: t; -*-
;;; Commentary:

;;; Code:

(use-package ledger-mode
  :ensure t
  :config
  (defun tofu/ledger-local-completions ()
    "Workaround annoyances in ledger mode by setting some buffer local stuff."
    (setq-local completion-styles '(basic)
                corfu-quit-no-match t
                corfu-auto-prefix 0))
  (defun tofu/ledger-save-buffer (&optional arg)
    (interactive)
    (save-excursion
      (ledger-post-align-postings 1 (buffer-end 1)))
    (save-buffer arg))
  :hook
  (ledger-mode . tofu/ledger-local-completions)
  :custom
  (ledger-highlight-xact-under-point nil)
  :mode
  ("\\.journal\\'" "\\.ledger\\'" "\\.hledger\\'" "\\.dat\\'")
  :bind
  (:map ledger-mode-map
   ("C-x C-s" . tofu/ledger-save-buffer)))

;; Copied the suggested config from hledger docs but not sure about all the options
(use-package flymake-hledger
  :ensure t
  :after (ledger-mode flymake)
  :hook
  (ledger-mode . flymake-hledger-enable)
  :custom
  ;; (flymake-show-diagnostics-at-end-of-line t)  ; might require Emacs 30
  (flymake-suppress-zero-counters t)
  ;; https://hledger.org/hledger.html#check))
  (flymake-hledger-checks '("accounts"
                            "commodities"
                            "balancednoautoconversion"
                            "ordereddates")))
                            ;; "recentassertions"
                            ;; "payees"
                            ;; "tags"
                            ;; "uniqueleafnames")))


(provide 'init-ledger)

;;; init-ledger.el ends here
