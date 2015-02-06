(require 'package)

;; packages (list )
(setq package-list
      '(yasnippet
        js2-mode
        sphinx-doc
        anaconda-mode
        virtualenvwrapper
        ggtags
        dired+
        emmet-mode
        color-theme-sanityinc-tomorrow
        multiple-cursors
        dockerfile-mode
        slime
        neotree
        py-autopep8
        writeroom-mode
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
