;; turnoff scollbars:

(when (fboundp 'horizontal-scroll-bar-mode)
   (horizontal-scroll-bar-mode -1))

(when (fboundp 'scroll-bar-mode)
   (scroll-bar-mode -1))

;; set font:
;; (custom-set-faces '(default ((t (:height 120 :family "Anonymous Pro")))))

;; theme:

(disable-theme 'zenburn)

(load-theme 'sanityinc-tomorrow-bright t)
