;; web-mode
(require 'web-mode)
(add-to-list 'auto-mode-alist '("\\.djhtml\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.handlebars\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.hbs\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.hbs\\'" . web-mode))

(setq web-mode-engines-alist
      '(("ctemplate"    . "\\.hbs\\'")
        ("ctemplate"    . "\\.handlebars\\'")
        ("django"       . "\\.html\\'")
        ))

(setq web-mode-markup-indent-offset 2
      web-mode-css-indent-offset 2
      web-mode-code-indent-offset 2)
(setq js-indent-level 2)

(require 'emmet-mode)

(add-hook 'nxml-mode-hook 'emmet-mode)
(add-hook 'web-mode-hook 'emmet-mode) ;; Auto-start on any markup modes
(add-hook 'css-mode-hook  'emmet-mode);; enable Emmet's css abbreviation.
(add-hook 'scss-mode-hook  'emmet-mode)

;; js
(add-hook 'web-mode-hook 'tern-mode)
(add-to-list 'auto-mode-alist '("\\.jsx?\\'" . web-mode))
(add-to-list 'company-backends 'company-tern)

(setq web-mode-content-types-alist
      '(("jsx" . "\\.js[x]?\\'")))

;; http://www.flycheck.org/manual/latest/index.html
(require 'flycheck)
;; turn on flychecking globally
(add-hook 'after-init-hook #'global-flycheck-mode)
;; disable json-jsonlist checking for json files
(setq-default flycheck-disabled-checkers (append flycheck-disabled-checkers '(json-jsonlist)))
;; disable jshint since we prefer eslint checking
(setq-default flycheck-disabled-checkers (append flycheck-disabled-checkers '(javascript-jshint)))
;; use eslint with web-mode for jsx files
(flycheck-add-mode 'javascript-eslint 'web-mode)
