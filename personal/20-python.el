;; python tweaks:
(add-hook 'python-mode-hook (lambda ()
                              (require 'sphinx-doc)
                              (sphinx-doc-mode t)))
(setq py-autopep8-options '("--max-line-length=400"))  ;; i like control this by my own
