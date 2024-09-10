;;; enable-disabled-commands.el --- Enable disabled commands -*- lexical-binding: t; -*-
;;; Commentary:

;;; Code:

;; Enable disabled commands I regularily use
(put 'narrow-to-region 'disabled nil)
(put 'upcase-region 'disabled nil)
(put 'downcase-region 'disabled nil)

(provide 'enable-disabled-commands)

;;; enable-disabled-commands.el ends here
