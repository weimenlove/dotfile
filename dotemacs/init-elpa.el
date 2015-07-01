(require 'package)
(dolist (source '(
                  ("melpa" . "http://melpa.milkbox.net/packages/")
                  ))
  (add-to-list 'package-archives source t))
(package-initialize)

;;; ------------------------------------------------------------------
;;; ------------------------------------------------------------------
;;; package.el
;;; everytime emacs starts, it will automatically check if those packages are
;;; missing, it will install them automatically
(when (not package-archive-contents)
  (package-refresh-contents))
(defvar elpa-packages
  '(auto-complete                       ;auto complete
	auto-complete-c-headers
    yasnippet                           ;yasnippet
    textmate                            ;textmate mode
    autopair                            ;auto pair the brackets
    ecb                                 ;emacs code browser
    undo-tree                           ;treat undo as a tree
    ;; vim emulation
    evil
    evil-nerd-commenter
    ;; Color theme
    color-theme
    color-theme-solarized
	))
(dolist (p elpa-packages)
  (when (not (package-installed-p p))
    (package-install p)))
(provide 'init-elpa)

