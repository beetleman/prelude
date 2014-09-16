;;; Config --- Python, Lisp, JS

;;; Commentary:
;; Config for Python/JS/Lisp

;;; Code:
(provide 'beetleman)

;; packages:
(require 'package)
(add-to-list 'package-archives
             '("elpy" . "http://jorgenschaefer.github.io/packages/"))

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
                     powerline
                     multiple-cursors
                     dockerfile-mode
                     slime
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

(tool-bar-mode -1)
(scroll-bar-mode -1)
(when (fboundp 'horizontal-scroll-bar-mode)
  (horizontal-scroll-bar-mode -1))

;; adaptive wrap line
(when (fboundp 'adaptive-wrap-prefix-mode)
  (defun my-activate-adaptive-wrap-prefix-mode ()
    "Toggle `visual-line-mode' and `adaptive-wrap-prefix-mode' simultaneously."
    (setf adaptive-wrap-extra-indent 2)
    (adaptive-wrap-prefix-mode (if visual-line-mode 1 -1)))
  (add-hook 'visual-line-mode-hook 'my-activate-adaptive-wrap-prefix-mode))

;; set font:
(add-to-list 'default-frame-alist '(font . "Source Code Pro-10"))

(setq prelude-clean-whitespace-on-save nil)
(setq whitespace-style (quote (spaces tabs newline space-mark tab-mark newline-mark)))

(disable-theme 'zenburn)
;; (require 'powerline)
(require 'moe-theme)
(moe-light)
;; (powerline-moe-theme)


;; dired
(require 'dired+)
(toggle-diredp-find-file-reuse-dir 1)

;; yasnippet
(require 'yasnippet)
(yas-global-mode 1)

;; PROGRAMING STUFF:

;; js tweaks:
(setq-default js2-auto-indent-p t)
(autoload 'js2-mode "js2-mode" nil t)
(add-to-list 'auto-mode-alist '("\\.js$" . js2-mode))
(add-to-list 'auto-mode-alist '("\\.json$" . js2-mode))

(setq js-indent-level 4)
(setq js2-indent-level 4)
(setq js2-basic-offset 4)

;; python tweaks:
(add-hook 'python-mode-hook (lambda ()
                              (require 'sphinx-doc)
                              (sphinx-doc-mode t)))


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

;; helm:
(global-set-key [C-menu] 'helm-imenu)
(global-set-key (kbd "C-c h") 'helm-projectile)


;; prelude tweaks:
(setq prelude-guru nil)

;; general tweak:
(define-key global-map (kbd "RET") 'newline-and-indent)

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

;; server:
(server-start)
;;; beetleman.el ends here
