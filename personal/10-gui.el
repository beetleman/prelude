;; turnoff scollbars:

(when (fboundp 'horizontal-scroll-bar-mode)
   (horizontal-scroll-bar-mode -1))

(when (fboundp 'scroll-bar-mode)
   (scroll-bar-mode -1))

;; set font:
;; (custom-set-faces '(default ((t (:height 120 :family "Anonymous Pro")))))

;; theme:

(disable-theme 'zenburn)

(require 'powerline)
(require 'moe-theme)

(setq moe-theme-highlight-buffer-id t)
(moe-theme-set-color 'purple)

(load-theme 'moe-dark t)
(powerline-moe-theme)

(highlight-indentation-mode)
