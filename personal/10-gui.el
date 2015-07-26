;; turnoff scollbars:

(when (fboundp 'horizontal-scroll-bar-mode)
   (horizontal-scroll-bar-mode -1))

(when (fboundp 'scroll-bar-mode)
   (scroll-bar-mode -1))

;; set font:
;; (custom-set-faces '(default ((t (:height 120 :family "Anonymous Pro")))))

;; theme:

(disable-theme 'zenburn)

(require 'color-theme-sanityinc-tomorrow)
(require 'powerline)

(load-theme 'sanityinc-tomorrow-night t)
(powerline-default-theme)

(global-linum-mode 1)
