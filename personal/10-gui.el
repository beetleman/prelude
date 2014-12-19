;; turnoff scollbars


(when (fboundp 'horizontal-scroll-bar-mode)
   (horizontal-scroll-bar-mode -1))


(when (fboundp 'scroll-bar-mode)
   (scroll-bar-mode -1))

;; set cursor color
;; (setq default-frame-alist '((cursor-color . "pink")))

;; set font:
;; (custom-set-faces '(default ((t (:height 105 :family "Source Code Pro")))))

;; theme
(disable-theme 'zenburn)

;; make the fringe stand out from the background
; (setq solarized-distinct-fringe-background t)

;; make the modeline high contrast
; (setq solarized-high-contrast-mode-line t)

;; Use less bolding
; (setq solarized-use-less-bold t)

;; Use more italics
(setq solarized-use-more-italic t)

;; Use less colors for indicators such as git:gutter, flycheck and similar.
; (setq solarized-emphasize-indicators nil)

;; Don't change size of org-mode headlines (but keep other size-changes)
; (setq solarized-scale-org-headlines nil)


(load-theme 'solarized-dark t)
