;;; init-smooth-scroll.el --- Smooth scrolling -*- lexical-binding: t; -*-
;;; Commentary:

;;; Code:

(use-package pixel-scroll
  :bind
  ([remap scroll-up-command]   . pixel-scroll-interpolate-down)
  ([remap scroll-down-command] . pixel-scroll-interpolate-up)
  :custom
  (pixel-scroll-precision-interpolate-page t)
  :init
  (pixel-scroll-precision-mode 1))

(provide 'init-smooth-scroll)
;;; init-smooth-scroll.el ends here
