;; python tweaks:
(require 'sphinx-doc)
(require 'anaconda-mode)

(add-to-list 'auto-mode-alist '("\\.py.sample\\'" . python-mode))
(add-to-list 'auto-mode-alist '("\\wscript\\'" . python-mode))

(add-hook 'python-mode-hook
          (lambda ()
            (sphinx-doc-mode t)))

;; from anaconda-mode
(defun my-anaconda-mode-goto ()
  "Goto definition or fallback to assignment for thing at point."
  (interactive)
  (anaconda-nav-navigate
   (or (anaconda-mode-call "goto_assignments")
       (anaconda-mode-call "goto_definitions")
       (error "No definition found"))
   t))

(add-hook 'anaconda-mode-hook
          (lambda ()
            (local-set-key (kbd "M-.") 'anaconda-mode-goto)
            (local-set-key (kbd "M-,") 'my-anaconda-mode-goto)
            (local-set-key (kbd "M-*") 'anaconda-nav-pop-marker)))

(setq py-autopep8-options '("--max-line-length=400"))  ;; i like control this by my own
