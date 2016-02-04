;; projectile/prelude tweaks

(global-set-key (kbd "C-c C-l") 'helm-imenu)
(global-set-key (kbd "C-c h") 'helm-projectile)

(custom-set-variables
 '(projectile-mode-line
   (quote
    (:eval (format " {%s}" (projectile-project-name))))))
;; (setq prelude-guru nil)
