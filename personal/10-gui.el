;; turnoff scollbars:

(when (fboundp 'horizontal-scroll-bar-mode)
   (horizontal-scroll-bar-mode -1))

(when (fboundp 'scroll-bar-mode)
   (scroll-bar-mode -1))

;; theme:
(disable-theme 'zenburn)

(setq calendar-location-name "Krakow, PL")
(setq calendar-latitude 50.06)
(setq calendar-longitude 19.93)

(require 'theme-changer)
(change-theme 'anti-zenburn 'zenburn)


;; set font:
(set-face-attribute 'default nil :family "Terminus" :height 120)
(custom-set-variables '(line-spacing 2))
