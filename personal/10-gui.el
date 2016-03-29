;; turnoff scollbars:

(when (fboundp 'horizontal-scroll-bar-mode)
   (horizontal-scroll-bar-mode -1))

(when (fboundp 'scroll-bar-mode)
   (scroll-bar-mode -1))

;; set font:
(set-face-attribute 'default nil :family "InputMono" :height 105)
(custom-set-variables '(line-spacing 2))

;; theme
(setq inhibit-x-resources 't)
(disable-theme 'zenburn)

(setq solarized-distinct-fringe-background t)
(load-theme 'solarized-light t)
