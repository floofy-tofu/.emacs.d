;;; init-spellcheck.el --- Configure spell checking -*- lexical-binding: t -*-
;;; Commentary:
;; Flyspell is SLOW; this is not finished.

;;; Code:


(setq ispell-program-name "aspell")

(setq ispell-extra-args '("--sug-mode=ultra"
                          "--lang=en_US"
                          "--run-together"
                          "--run-together-limit=16"
                          "--camel-case"))

;; FIXME: make this work

;; flyspell-generic-check-word-predicate ; use for prog mode

;; define minor mode
;; when enabled:
;; - spellcheck whole buffer
;; - start a timer via (run-with-timer)
;;   - spell check visible portion
;; - add save hook to spellcheck whole file
;; when disabled:
;; - delete hook
;; - disable timer
;; - undo fontifying? somehow ...

(provide 'init-spellcheck)

;;; init-spellcheck.el ends here
