;; web-mode
(add-to-list 'auto-mode-alist '("\\.djhtml\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.handlebars\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.hbs\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.hbs\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.jsx\\'" . web-mode))

(setq web-mode-engines-alist
      '(("ctemplate"    . "\\.hbs\\'")
        ("ctemplate"    . "\\.handlebars\\'")
        ("django"       . "\\.html\\'")
        )
      )


(setq web-mode-code-indent-offset 2)

(require 'emmet-mode)

(add-hook 'nxml-mode-hook 'emmet-mode)
(add-hook 'web-mode-hook 'emmet-mode) ;; Auto-start on any markup modes
(add-hook 'css-mode-hook  'emmet-mode);; enable Emmet's css abbreviation.
(add-hook 'scss-mode-hook  'emmet-mode)
