;; diminish configuration

(require 'diminish)
(add-hook 'anaconda-mode-hook
          (lambda ()
            (diminish 'anaconda-mode)))
(add-hook 'company-mode-hook
          (lambda ()
            (diminish 'company-mode)))
(add-hook 'whitespace-mode-hook
          (lambda ()
            (diminish 'whitespace-mode)))
(add-hook 'flyspell-mode-hook
          (lambda ()
            (diminish 'flyspell-mode)))
(add-hook 'smartparens-mode-hook
          (lambda ()
            (diminish 'smartparens-mode)))
(add-hook 'prelude-mode-hook
          (lambda ()
            (diminish 'prelude-mode)))
(add-hook 'sphinx-doc-mode-hook
          (lambda ()
            (diminish 'sphinx-doc-mode)))
(add-hook 'yas-minor-mode-hook
          (lambda ()
            (diminish 'yas-minor-mode)))
(add-hook 'subword-mode-hook
          (lambda ()
            (diminish 'subword-mode)))
(add-hook 'emmet-mode-hook
          (lambda ()
            (diminish 'emmet-mode)))
(add-hook 'highlight-indentation-mode-hook
          (lambda ()
            (diminish 'highlight-indentation-mode)))
(add-hook 'highlight-indentation-current-column-mode-hook
          (lambda ()
            (diminish 'highlight-indentation-current-column-mode)))
(add-hook 'guru-mode-hook
          (lambda ()
            (diminish 'guru-mode)))
(eval-after-load "helm-mode"
  '(progn
     (diminish 'helm-mode)
     ))
