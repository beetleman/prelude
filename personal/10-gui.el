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
(load-theme 'sanityinc-tomorrow-eighties t)
