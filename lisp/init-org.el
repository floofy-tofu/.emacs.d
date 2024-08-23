;; Uhh this was originally from my literate config deal with it later

;; Org-mode is the first package configured to avoid issues with conflicting versions.

;; My org setup is a complete mess and probably should be cleaned up.

;; ** Setup

;; Call use-package

;; #+begin_src emacs-lisp
;;   (use-package org
;;     :bind (("C-c l" . org-store-link)
;;            ("C-c a" . org-agenda))
;;     :config
;;     (setq org-directory "~/Org")

;;     (setq org-ellipsis " ▾") ; Replace the ... on collapsed headers

;;     (setq org-agenda-start-with-log-mode t)
;;     (setq org-log-done 'time)
;;     (setq org-log-into-drawer t)

;;     (setq org-agenda-files
;;           '("~/Org"))

;;     (plist-put org-format-latex-options :scale 1.5) ; Make LaTeX previews bigger

;;     :hook
;;     ((org-mode . org-indent-mode)))
;; #+end_src

;; ** Structure Templates

;; Makes it easier to insert source blocks.

;; #+begin_src emacs-lisp
;;   (with-eval-after-load 'org
;;     (require 'org-tempo)

;;     (add-to-list 'org-structure-template-alist '(el . "src emacs-lisp"))
;;     (add-to-list 'org-structure-template-alist '(mat . "src matlab"))
;;     (add-to-list 'org-structure-template-alist '(oct . "src octave"))
;;     (add-to-list 'org-structure-template-alist '(py . "src python"))
;;     (add-to-list 'org-structure-template-alist '(pyfile . "src python :results file"))
;;     (add-to-list 'org-structure-template-alist '(cl . "src lisp"))
;;     (add-to-list 'org-structure-template-alist '(ml . "src ocaml"))
;;     (add-to-list 'org-structure-template-alist '(cpp . "src c++"))
;;     (add-to-list 'org-structure-template-alist '(rv . "src riscv"))

;;     ;; Not for code, I think <q works but whatever
;;     (add-to-list 'org-structure-template-alist '(quote . "quote")))
;; #+end_src

;; ** Configure Babel Languages

;; Configure languages that can be evaluated in org

;; #+begin_src emacs-lisp
;;   (with-eval-after-load 'org
;;     (org-babel-do-load-languages
;;      'org-babel-load-languages
;;      '((emacs-lisp . t)
;;        (lisp . t)
;;        (python . t)
;;        (ocaml . t)))
;;     (setq org-babel-lisp-eval-fn #'sly-eval
;;           org-confirm-babel-evaluate nil)
;;     (push '("conf-unix" . conf-unix) org-src-lang-modes))
;; #+end_src

;; ** Auto Tangle Configuration Files

;; Kinda jank, stolen code.

;; #+begin_src emacs-lisp
;;   ;; Automatically tangle our Emacs.org config file when we save it
;;   (defun config/org-babel-tangle-config ()
;;     (when (string-equal (file-name-directory (buffer-file-name))
;;                         (expand-file-name "~/.emacs.d/"))
;;       ;; Dynamic scoping to the rescue
;;       (let ((org-confirm-babel-evaluate nil))
;;         (org-babel-tangle))))

;;   (add-hook 'org-mode-hook
;;             (lambda ()
;;               (add-hook 'after-save-hook #'config/org-babel-tangle-config)))
;; #+end_src

;; ** Export Settings

;; #+begin_src emacs-lisp
;;   (require 'ox-latex)
;; #+end_src

;; Change paragraph spacing:

;; #+begin_src emacs-lisp
;;   (add-to-list 'org-latex-packages-alist
;;                '("skip=10pt plus1pt, indent=0em" "parskip" nil))
;; #+end_src


;; Hyperlinks should be colored!

;; #+begin_src emacs-lisp
;;   ;; URLs should break on hyphens
;;   (add-to-list 'org-latex-packages-alist "\\PassOptionsToPackage{hyphens}{url}")

;;   ;; Disable the automatic insertion of hypersetup
;;   (customize-set-value
;;      'org-latex-hyperref-template
;;      "\\hypersetup{
;;   linktoc=all,
;;   colorlinks=true,
;;   urlcolor=DeepSkyBlue1
;;   }
;;   ")

;;   ;; Add xcolor to included packages
;;   (add-to-list 'org-latex-packages-alist "\\usepackage[x11names]{xcolor}")
;; #+end_src

;; Use =engraved= exporter! Looks awesome for PDFs.

(use-package engrave-faces
  :ensure t)


;; LaTeX export using Emacs native syntax highlighting.

;; #+begin_src emacs-lisp
;;   ;; xelatex
;;   (setq org-latex-compiler "xelatex")

;;   ;; Syntax highlighting
;;   (setq org-latex-src-block-backend 'engraved)
;;   ;; org-latex-engraved-theme "need a good light theme")

;;   ;; Geometry
;;   (add-to-list 'org-latex-packages-alist
;;                '("" "geometry" nil))

;;   ;; Smart quotes
;;   (setq org-export-with-smart-quotes t)

;;   ;; Beamer export, for additional info see https://github.com/fniessen/refcard-org-beamer
;;   (eval-after-load "ox-latex"

;;     ;; update the list of LaTeX classes and associated header (encoding, etc.)
;;     ;; and structure
;;     '(add-to-list 'org-latex-classes
;;                   `("beamer"
;;                     ,(concat "\\documentclass[presentation]{beamer}\n"
;;                              "[DEFAULT-PACKAGES]"
;;                              "[PACKAGES]"
;;                              "[EXTRA]\n")
;;                     ("\\section{%s}" . "\\section*{%s}")
;;                     ("\\subsection{%s}" . "\\subsection*{%s}")
;;                     ("\\subsubsection{%s}" . "\\subsubsection*{%s}"))))
;; #+end_src

;; Use correct background for html export.

;; #+begin_src emacs-lisp
;;   ;; Taken from stack exchange
;;   ;; https://emacs.stackexchange.com/questions/3374/set-the-background-of-org-exported-code-blocks-according-to-theme
;;   (defun my/org-inline-css-hook (exporter)
;;     "Insert custom inline css to automatically set the
;;   background of code to whatever theme I'm using's background"
;;     (when (eq exporter 'html)
;;       (let* ((my-pre-bg (face-background 'default))
;;              (my-pre-fg (face-foreground 'default)))
;;         (setq
;;          org-html-head-extra
;;          (concat
;;           org-html-head-extra
;;           (format "<style type=\"text/css\">\n pre.src {background-color: %s; color: %s;}</style>\n"
;;                   my-pre-bg my-pre-fg))))))

;;   (with-eval-after-load 'org
;;     (add-hook 'org-export-before-processing-hook 'my/org-inline-css-hook))
;; #+end_src

;; ** HTML Email

;; Perhaps change this to engraved?

;; Install a newer version of htmlize

;; #+begin_src emacs-lisp
;;   (use-package htmlize)
;; #+end_src

;; Install the org-mime package


(use-package org-mime
  :ensure t
  :config
  (setq org-mime-export-options '(:section-numbers nil
                                  :with-author nil
                                  :with-toc nil))
  ;; ;; dark background for code blocks
  ;; (add-hook 'org-mime-html-hook
  ;;           (lambda ()
  ;;             (org-mime-change-element-style
  ;;              "pre" (format "color: %s; background-color: %s; padding: 0.5em;"
  ;;                            "#ebdbb2" "#282828"))))

  ;; offset blockquotes
  (add-hook 'org-mime-html-hook
            (lambda ()
              (org-mime-change-element-style
               "blockquote" "border-left: 2px solid gray; padding-left: 4px;")))

  ;; Confirm sending non-html mail
  (add-hook 'message-send-hook 'org-mime-confirm-when-no-multipart))


(provide 'init-org)

;; ** Citeproc

;; Use citeproc for citations in Org. This is awesome.

;; #+begin_src emacs-lisp
;;   (use-package citeproc
;;     :after org)
;; #+end_src

;; ** Fragtog

;; Toggle LaTeX fragments automagically:

;; #+begin_src emacs-lisp
;;   (use-package org-fragtog
;;     :after org
;;     :hook (org-mode . org-fragtog-mode))
;; #+end_src
