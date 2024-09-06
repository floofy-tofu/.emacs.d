;;; init-ledger.el --- Install and configure hledger -*- lexical-binding: t; -*-
;;; Commentary:

;;; Code:

(use-package ledger-mode
  :ensure t
  :mode ("\\.journal\\'" "\\.ledger\\'" "\\.hledger\\'" "\\.dat\\'"))

;; Copied the suggested config from hledger docs but not sure about all the options
(use-package flymake-hledger
  :ensure t
  :after (ledger-mode flymake)
  :hook ((ledger-mode . flymake-hledger-enable))
  ;; Make C-x ` work ?
  ;; XXX Both of these work only in the first file opened; debugging needed.
  ;; (ledger-mode . (lambda () (setq next-error-function 'flymake-goto-next-error)))
  ;; (ledger-mode . (lambda () (setq next-error-function (lambda (num reset) (when reset (goto-char (point-min))) (flymake-goto-next-error num)))))

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
