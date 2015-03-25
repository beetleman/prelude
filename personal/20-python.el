;; python tweaks:
(require 'sphinx-doc)
(add-hook 'python-mode-hook (lambda ()
                              (highlight-indentation-mode t)
                              (highlight-indentation-current-column-mode t)
                              (sphinx-doc-mode t)))

(add-hook 'anaconda-mode-hook (lambda ()
                              (local-set-key (kbd "M-.") 'anaconda-mode-goto)
                              (local-set-key (kbd "M-*") 'anaconda-nav-pop-marker)))

(setq py-autopep8-options '("--max-line-length=400"))  ;; i like control this by my own
