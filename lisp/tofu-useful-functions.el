;;; tofu-useful-functions.el --- Useful functions -*- lexical-binding: t; -*-
;;; Commentary:
;; Functions that are useful, interactive or not

;;; Code:


;;; Scripting functions
(defun tofu/path-in-user-emacs (file-path)
  "Make a path relative to `user-emacs-directory'"
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
  "Prompt for buffer, show its full file path and add it to kill ring."
  (interactive "b")
  (let ((file-path (buffer-file-name (get-buffer buffer))))
    (message file-path)
    (kill-new file-path)))

(defun tofu/get-breakpoint-at-point ()
  (interactive)
  (let* ((file-path (buffer-file-name))
         (breakpoint (concat file-path ":" (int-to-string (line-number-at-pos)))))
    (message breakpoint)
    (kill-new breakpoint)))


(provide 'tofu-useful-functions)
;;; tofu-useful-functions.el ends here
