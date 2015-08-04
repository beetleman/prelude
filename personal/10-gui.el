;; turnoff scollbars:

(when (fboundp 'horizontal-scroll-bar-mode)
   (horizontal-scroll-bar-mode -1))

(when (fboundp 'scroll-bar-mode)
   (scroll-bar-mode -1))

;; set font:
(custom-set-faces '(default ((t (:height 110 :family "DejaVu Sans Mono")))))

;; theme:

(disable-theme 'zenburn)

(require 'color-theme-sanityinc-tomorrow)
(load-theme 'sanityinc-tomorrow-night t)
