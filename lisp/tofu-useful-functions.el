;;; tofu-useful-functions.el --- Useful functions -*- lexical-binding: t; -*-
;;; Commentary:
;; Functions that are useful, interactive or not

;;; Code:


;;; Scripting functions
(defun tofu/prepend-user-emacs (file-path)
  "Prepend `user-emacs-directory' to FILE-PATH."
  (concat user-emacs-directory file-path))


;;; Interactive functions
;; Not mode specific; those go into their respective config.
(defun tofu/get-absolute-buffer-path ()
  "Show full file path of current buffer and add to kill ring."
  (interactive)
  (let ((file-path (buffer-file-name)))
    (message file-path)
    (kill-new file-path)))

(defun tofu/get-absolute-buffer-path-of (buffer)
  "Prompt for BUFFER, show its full file path and add it to kill ring."
  (interactive "b")
  (let ((file-path (buffer-file-name (get-buffer buffer))))
    (message file-path)
    (kill-new file-path)))

(defun tofu/get-breakpoint-at-point ()
  "Show get a /file/path:linenum style breakpoint marker and append to kill ring."
  (interactive)
  (let* ((file-path (buffer-file-name))
         (breakpoint (concat file-path ":" (int-to-string (line-number-at-pos)))))
    (message breakpoint)
    (kill-new breakpoint)))

(defun tofu/insert-elisp-header-and-footer (description)
  "Insert a header (with a prompted DESCRIPTION) and footer to please flymake.
DOES NOT TRY TO BE SMART ABOUT IT AND CONSIDER IF IT ALREADY EXISTS OR FILE
VARIABLES."
  (interactive "sFile Description: ")
  (let ((file (car (last (string-split buffer-file-name "/")))))
    ;; There's gotta be a better way to extract the filename here...
    (save-excursion
      (goto-char (point-min))
      (insert ";;; " file " --- " description " -*- lexical-binding: t; -*-\n")
      (insert ";;; Commentary:\n\n")
      (insert ";;; Code:\n\n")
      (goto-char (point-max))
      (insert ";;; " file " ends here"))))


(provide 'tofu-useful-functions)
;;; tofu-useful-functions.el ends here
