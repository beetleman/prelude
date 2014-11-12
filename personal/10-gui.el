;; turnoff scollbars

(tool-bar-mode -1)

(when (fboundp 'horizontal-scroll-bar-mode)
  (horizontal-scroll-bar-mode -1))

(scroll-bar-mode -1)

;; set cursor color
(setq default-frame-alist '((cursor-color . "pink")))

;; set font:
(custom-set-faces '(default ((t (:height 105 :family "Source Code Pro")))))

;; theme
(disable-theme 'zenburn)
(require 'moe-theme)
;; Choose the one you like, (moe-light) or (moe-dark)
(moe-dark)
