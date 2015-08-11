;; turnoff scollbars:

(when (fboundp 'horizontal-scroll-bar-mode)
   (horizontal-scroll-bar-mode -1))

(when (fboundp 'scroll-bar-mode)
   (scroll-bar-mode -1))

;; theme:
(disable-theme 'zenburn)

(require 'color-theme-sanityinc-tomorrow)
(load-theme 'sanityinc-tomorrow-night t)

;; set font:
(set-face-attribute 'default nil :family "Terminus" :height 120)
(custom-set-variables '(line-spacing 2))
