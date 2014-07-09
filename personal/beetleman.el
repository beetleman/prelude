;; packages:
(require 'package)
(add-to-list 'package-archives
             '("elpy" . "http://jorgenschaefer.github.io/packages/"))

                                        ; packages list
(setq package-list '(auto-complete
                     yasnippet
                     js2-mode
                     elpy
                     ecb
                     sphinx-doc
                     ggtags
                     dired+
                     emmet-mode
                     ample-theme
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
(if (display-graphic-p)
    (progn
      (tool-bar-mode -1)
      (scroll-bar-mode -1)))   

;; set font:
(add-to-list 'default-frame-alist '(font . "Source Code Pro-10"))
;; set cursor color
(add-to-list 'default-frame-alist '(cursor-color . "white"))

(blink-cursor-mode 1)

(global-visual-line-mode 1) ; 1 for on, 0 for off.


(setq prelude-clean-whitespace-on-save nil)
(setq whitespace-style (quote (spaces tabs newline space-mark tab-mark newline-mark)))

(disable-theme 'zenburn)
(load-theme 'ample t)

;; dired
(require 'dired+)
(toggle-diredp-find-file-reuse-dir 1)


;; auto-commplete
(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories "~/.emacs.d/ac-dict")
(ac-config-default)
(ac-flyspell-workaround)
;;(ac-linum-workaround)

;; linum-mode:
;; (global-linum-mode 1)
;; (setq linum-format " %d ")
;; (setq linum-mode-inhibit-modes-list '(eshell-mode
;;                                       shell-mode
;;                                       erc-mode
;;                                       jabber-roster-mode
;;                                       jabber-chat-mode
;;                                       gnus-group-mode
;;                                       gnus-summary-mode
;;                                       gnus-article-mode
;;                                       speedbar-mode))
;; (defadvice linum-on (around linum-on-inhibit-for-modes)
;;   "Stop the load of linum-mode for some major modes."
;;     (unless (member major-mode linum-mode-inhibit-modes-list)
;;       ad-do-it))
;; (ad-activate 'linum-on)

;; ecb-activate
(require 'ecb)
                                        ;(require 'ecb-autoloads)
(semantic-mode 1)
(setq ecb-examples-bufferinfo-buffer-name nil)

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
;;(add-hook 'python-mode-hook 'jedi:setup)
;;(setq jedi:setup-keys t)                      ; optional
;;(setq jedi:complete-on-dot t)                 ; optional


(elpy-enable)
(add-hook 'pyvenv-post-activate-hooks 'pyvenv-restart-python )
(setq elpy-rpc-backend "jedi")

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

;; server:
(server-start)

;; prelude tweaks:
(setq prelude-guru nil)

;; general tweak:

(define-key global-map (kbd "RET") 'newline-and-indent)
