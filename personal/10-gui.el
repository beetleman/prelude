;; turnoff scollbars:

(when (fboundp 'horizontal-scroll-bar-mode)
   (horizontal-scroll-bar-mode -1))

(when (fboundp 'scroll-bar-mode)
   (scroll-bar-mode -1))

;; set font:
;; (custom-set-faces '(default ((t (:height 120 :family "Anonymous Pro")))))

;; theme:

(disable-theme 'zenburn)

(require 'moe-theme)

(setq calendar-latitude +50)
(setq calendar-longitude +20)

(require 'moe-theme-switcher)

(highlight-indentation-mode)
