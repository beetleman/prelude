;; packages:

; packages list
(setq package-list '(auto-complete
                     yasnippet
                     js2-mode
                     skewer-mode))
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

(set-default-font "Inconsolata-12")

(setq prelude-whitespace 1)


;; auto-commplete
(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories "~/.emacs.d/ac-dict")
(ac-config-default)
(ac-flyspell-workaround)
(ac-linum-workaround)

;; linum-mode:
(global-linum-mode 1)
(setq linum-mode-inhibit-modes-list '(eshell-mode
                                      shell-mode
                                      erc-mode
                                      jabber-roster-mode
                                      jabber-chat-mode
                                      gnus-group-mode
                                      gnus-summary-mode
                                      gnus-article-mode))
(defadvice linum-on (around linum-on-inhibit-for-modes)
  "Stop the load of linum-mode for some major modes."
    (unless (member major-mode linum-mode-inhibit-modes-list)
      ad-do-it))
(ad-activate 'linum-on)

;; yasnippet
(require 'yasnippet)
(yas-global-mode 1)

;; js tweaks:
(setq-default js2-auto-indent-p t)
(autoload 'js2-mode "js2-mode" nil t)
(add-to-list 'auto-mode-alist '("\\.js$" . js2-mode))
(add-to-list 'auto-mode-alist '("\\.json$" . js2-mode))

(setq js-indent-level 2)
(setq js2-indent-level 2)
(setq js2-basic-offset 2)

(skewer-setup)


;; server:
(server-start)

;; prelude tweaks:
(setq prelude-guru nil)

;; general tweak:
(define-key global-map (kbd "RET") 'newline-and-indent)
