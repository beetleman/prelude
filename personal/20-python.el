;; python tweaks:
(require 'sphinx-doc)
(require 'pyenv-mode)
(pyenv-mode)

(add-to-list 'auto-mode-alist '("\\.py.sample\\'" . python-mode))
(add-to-list 'auto-mode-alist '("\\wscript\\'" . python-mode))

(add-hook 'python-mode-hook
          (lambda ()
            (sphinx-doc-mode t)))

(setq py-autopep8-options '("--max-line-length=400"))  ;; i like control this by my own
