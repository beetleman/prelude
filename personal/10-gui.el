;; turnoff scollbars:

(when (fboundp 'horizontal-scroll-bar-mode)
   (horizontal-scroll-bar-mode -1))

(when (fboundp 'scroll-bar-mode)
   (scroll-bar-mode -1))

;; set font:
;; (custom-set-faces '(default ((t (:height 120 :family "Anonymous Pro")))))

;; theme:

(disable-theme 'zenburn)

(load-theme 'sanityinc-tomorrow-night t)

;; dirty hacks for cursor color in gnome/kde
(setq default-frame-alist
      (append default-frame-alist
              '((cursor-color . "light coral")
                )))

(highlight-indentation-mode)
