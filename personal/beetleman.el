;; packages:

; packages list
(setq package-list '(auto-complete
                     yasnippet
                     js2-mode
                     skewer-mode
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
(add-to-list 'default-frame-alist '(font . "Inconsolata-g-11"))
; set cursor color
(add-to-list 'default-frame-alist '(cursor-color . "white"))

(blink-cursor-mode 1)

(setq prelude-whitespace 1)
(disable-theme 'zenburn)
(load-theme 'odersky t)

;; auto-commplete
(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories "~/.emacs.d/ac-dict")
(ac-config-default)
(ac-flyspell-workaround)
;; (ac-linum-workaround)

;; linum-mode:
;; (global-linum-mode 1)
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

;; mu4e
(require 'mu4e)
(require 'smtpmail)
(setq mu4e-sent-messages-behavior 'delete)

(setq
 mu4e-view-show-images t
 mu4e-view-image-max-width 800
 mu4e-headers-date-format "%d/%b/%Y %H:%M" ; date format
 mu4e-html2text-command "html2text -width 72 -utf8")


(setq  mu4e-sent-folder "/nigrantis.tigris@gmail.com/[Gmail].Sent Mail"
       mu4e-drafts-folder "/nigrantis.tigris@gmail.com/[Gmail].Drafts"
       mu4e-trash-folder  "/nigrantis.tigris@gmail.com/[Gmail].Trash"
       user-mail-address "nigrantis.tigris@gmail.com"
       smtpmail-default-smtp-server "smtp.gmail.com"
       smtpmail-smtp-server "smtp.gmail.com"
       smtpmail-stream-type 'starttls
       smtpmail-smtp-service 587)


(defvar my-mu4e-account-alist
  '(("nigrantis.tigris@gmail.com"
     (mu4e-sent-folder "/nigrantis.tigris@gmail.com/[Gmail].Sent Mail")
     (mu4e-drafts-folder "/nigrantis.tigris@gmail.com/[Gmail].Drafts")
     (setq mu4e-trash-folder  "/nigrantis.tigris@gmail.com/[Gmail].Trash")
     (user-mail-address "nigrantis.tigris@gmail.com")
    ;(message-signature-file ".Signature1.txt")
     (smtpmail-default-smtp-server "smtp.gmail.com")
    ;(smtpmail-local-domain "account1.tld")
     (smtpmail-smtp-server "smtp.gmail.com")
     (smtpmail-stream-type starttls)
     (smtpmail-smtp-service 587))
    ("mateusz.probachta@gmail.com"
     (mu4e-sent-folder "/mateusz.probachta@gmail.com/[Google Mail].Sent Mail")
     (mu4e-drafts-folder "/mateusz.probachta@gmail.com/[Google Mail].Drafts")
     (setq mu4e-trash-folder  "/mateusz.probachta@gmail.com/[Google Mail].Trash")
     (user-mail-address "mateusz.probachta@gmail.com")
    ;(message-signature-file ".Signature1.txt")
     (smtpmail-default-smtp-server "smtp.gmail.com")
    ;(smtpmail-local-domain "account1.tld")
     (smtpmail-smtp-server "smtp.gmail.com")
     (smtpmail-stream-type starttls)
     (smtpmail-smtp-service 587))
    )
  )
(defun my-mu4e-set-account ()
  "Set the account for composing a message."
  (let* ((account
          (if mu4e-compose-parent-message
              (let ((maildir (mu4e-message-field mu4e-compose-parent-message :maildir)))
                (string-match "/\\(.*?\\)/" maildir)
                (match-string 1 maildir))
            (completing-read (format "Compose with account: (%s) "
                                     (mapconcat #'(lambda (var) (car var)) my-mu4e-account-alist "/"))
                             (mapcar #'(lambda (var) (car var)) my-mu4e-account-alist)
                             nil t nil nil (caar my-mu4e-account-alist))))
         (account-vars (cdr (assoc account my-mu4e-account-alist))))
    (if account-vars
        (mapc #'(lambda (var)
                  (set (car var) (cadr var)))
              account-vars)
      (error "No email account found"))))

(add-hook 'mu4e-compose-pre-hook 'my-mu4e-set-account)

;; web-mode
(setq web-mode-engines-alist
      '(("ctemplate"    . "\\.html\\'"))
)
