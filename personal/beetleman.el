;;; Config --- Python, Lisp, JS

;;; Commentary:
;; Config for Python/JS/Lisp

;;; Code:
(provide 'beetleman)

;; packages:
(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/"))
(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/"))
(add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/") t)


;; packages (list )
(setq package-list '(yasnippet
                     js2-mode
                     sphinx-doc
                     anaconda-mode
                     virtualenvwrapper
                     ggtags
                     dired+
                     adaptive-wrap
                     emmet-mode
                     moe-theme
                     multiple-cursors
                     dockerfile-mode
                     slime
                     neotree
                     py-autopep8
                     ))

;; initialize
(package-initialize)
;; refresh
(when (not package-archive-contents)
  (package-refresh-contents))
;; install packagest form 'package-list
(dolist (package package-list)
  (when (not (package-installed-p package))
    (package-install package)))

;; gui tweaks:
;; turnoff scollbars

(setq default-frame-alist '((cursor-color . "pink")))
(tool-bar-mode -1)
(scroll-bar-mode -1)
(when (fboundp 'horizontal-scroll-bar-mode)
  (horizontal-scroll-bar-mode -1))

;; set font:
(custom-set-faces '(default ((t (:height 100 :family "Source Code Pro")))))

(setq prelude-clean-whitespace-on-save nil)
(setq whitespace-style (quote (spaces tabs newline space-mark tab-mark newline-mark)))

;; theme
(disable-theme 'zenburn)
(require 'moe-theme)
;; Choose the one you like, (moe-light) or (moe-dark)
(require 'moe-theme-switcher)

;; dired
(require 'dired+)
(toggle-diredp-find-file-reuse-dir 1)

;; yasnippet
(require 'yasnippet)
(yas-global-mode 1)

;; PROGRAMING STUFF:

;; js tweaks:
(setq-default js2-auto-indent-p t)

(setq js-indent-level 4)
(setq js2-indent-level 4)
(setq js2-basic-offset 4)

;; python tweaks:
(add-hook 'python-mode-hook (lambda ()
                              (require 'sphinx-doc)
                              (sphinx-doc-mode t)))
(setq py-autopep8-options '("--max-line-length=400"))  ;; i like control this by my own

;; web-mode
(add-to-list 'auto-mode-alist '("\\.djhtml\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.html\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.hbs\\'" . web-mode))

(setq web-mode-engines-alist
      '(("ctemplate"    . "\\.hbs\\'")
        ("django"       . "\\.html\\'")
        )
      )

(require 'emmet-mode)

(add-hook 'web-mode-hook 'emmet-mode) ;; Auto-start on any markup modes
(add-hook 'css-mode-hook  'emmet-mode);; enable Emmet's css abbreviation.
(add-hook 'scss-mode-hook  'emmet-mode)

;; lisp
(require 'slime-autoloads)
(setq inferior-lisp-program "/usr/bin/sbcl")
(add-to-list 'slime-contribs 'slime-fancy)

;; ispell tweak
(defun fd-switch-dictionary()
  (interactive)
  (let* ((dic ispell-current-dictionary)
         (change (if (string= dic "polish") "english" "polish")))
    (ispell-change-dictionary change)
    (message "Dictionary switched from %s to %s" dic change)
    ))

(global-set-key (kbd "<f8>")   'fd-switch-dictionary)
(global-set-key (kbd "<f7>") 'flyspell-mode)
(flyspell-mode -1)

;; helm:
(global-set-key [C-menu] 'helm-imenu)

;; prelude tweaks:
(setq prelude-guru nil)

;; projectile tweaks
(require 'helm-projectile)
(helm-projectile-on)
(global-set-key (kbd "C-c h") 'helm-projectile)
(setq projectile-enable-caching t)

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

;; multiple-cursors
(require 'multiple-cursors)
(global-set-key (kbd "C-S-c C-S-c") 'mc/edit-lines)
(global-set-key (kbd "C->") 'mc/mark-next-like-this)
(global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
(global-set-key (kbd "C-c C->") 'mc/mark-all-like-this)

;; noetree
(require 'neotree)
(global-set-key [f9] 'neotree-toggle)

;; server:
;; (server-start)
;;; beetleman.el ends here
