;; projectile/prelude tweaks

(require 'helm-projectile)
(helm-projectile-on)
(global-set-key (kbd "C-c h") 'helm-projectile)

(setq projectile-enable-caching t)

(global-set-key [C-menu] 'helm-imenu)

(setq prelude-guru nil)
