;; packages:

; packages list
(setq package-list '(auto-complete
                     yasnippet
                     js2-mode
                     skewer-mode
                     jedi
                     sublime-themes))
; initialize
(package-initialize)
; refresh
(when (not package-archive-contents)
  (package-refresh-contents))
; install packagest form 'package-list
(dolist (package package-list)
  (when (not (package-installed-p package))
    (package-install package)))

;; gui tweaks:
; turnoff scollbars
(scroll-bar-mode -1)

; set font:
(add-to-list 'default-frame-alist '(font . "Source Code Pro-10"))
; set cursor color
(add-to-list 'default-frame-alist '(cursor-color . "white"))

(blink-cursor-mode 1)

(setq prelude-whitespace 1)

(disable-theme 'zenburn)
(load-theme 'spolsky t)

;; auto-commplete
(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories "~/.emacs.d/ac-dict")
(ac-config-default)
(ac-flyspell-workaround)
;(ac-linum-workaround)

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


;; yasnippet
(require 'yasnippet)
(yas-global-mode 1)
; my snippets under  "~/.emacs.d/personal/snippets"
(setq yas/root-directory "~/.emacs.d/personal/snippets")
; Load the snippets
(yas/load-directory yas/root-directory)


;; PROGRAMING STUFF:

;; js tweaks:
(setq-default js2-auto-indent-p t)
(autoload 'js2-mode "js2-mode" nil t)
(add-to-list 'auto-mode-alist '("\\.js$" . js2-mode))
(add-to-list 'auto-mode-alist '("\\.json$" . js2-mode))

(setq js-indent-level 2)
(setq js2-indent-level 2)
(setq js2-basic-offset 2)

(skewer-setup)

;; python tweaks:
(add-hook 'python-mode-hook 'jedi:setup)
(setq jedi:setup-keys t)                      ; optional
(setq jedi:complete-on-dot t)                 ; optional

;; server:
(server-start)

;; prelude tweaks:
(setq prelude-guru nil)

;; general tweak:

(define-key global-map (kbd "RET") 'newline-and-indent)

;; web-mode
(add-to-list 'auto-mode-alist '("\\.djhtml\\'" . web-mode))
(setq web-mode-engines-alist
      '(("ctemplate"    . "\\.html\\'")
        ("django"       . "\\.djhtml\\'")
        )
)
