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
                     ample-theme
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
