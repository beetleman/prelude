;; turnoff scollbars:

(when (fboundp 'horizontal-scroll-bar-mode)
   (horizontal-scroll-bar-mode -1))

(when (fboundp 'scroll-bar-mode)
   (scroll-bar-mode -1))

;; set font:
(set-face-attribute 'default nil :family "InputMono" :height 105)
(custom-set-variables '(line-spacing 2))

(disable-theme 'zenburn)

;; make the fringe stand out from the background
(setq solarized-distinct-fringe-background t)

;; Don't change the font for some headings and titles
(setq solarized-use-variable-pitch t)

;; make the modeline high contrast
(setq solarized-high-contrast-mode-line nil)

;; Use less bolding
(setq solarized-use-less-bold nil)

;; Use more italics
(setq solarized-use-more-italic t)

;; Use less colors for indicators such as git:gutter, flycheck and similar
(setq solarized-emphasize-indicators nil)

;; Don't change size of org-mode headlines (but keep other size-changes)
(setq solarized-scale-org-headlines t)
(setq x-underline-at-descent-line t)

(load-theme 'solarized-light t)
