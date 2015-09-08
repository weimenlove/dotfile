
;; http://melpa.org/#/getting-started
(require 'package) ;; You might already have this line
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/"))
(when (< emacs-major-version 24)
  ;; For important compatibility libraries like cl-lib
  (add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/")))
(package-initialize) ;; You might already have this line

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
    linum-relative
    textmate                            ;textmate mode
    autopair                            ;auto pair the brackets
    undo-tree                           ;treat undo as a tree
    ;; vim emulation
    evil
    ;; Color theme
    color-theme
    color-theme-solarized
    ))
(dolist (p elpa-packages)
  (when (not (package-installed-p p))
    (package-install p)))
(provide 'init-elpa)

