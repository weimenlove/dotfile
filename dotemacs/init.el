;; -*- coding: utf-8 -*-

;;Personal information
(setq user-full-name "Fantity Wei"
  user-mail-address "weimenlove@gmail.com")

;;Emacs Initialization
(setq emacs-load-start-time (current-time))
(add-to-list 'load-path "~/.emacs.d/lisp")
;;(add-to-list 'load-path "~/elisp")

;;----------------------------------------------------------------------------
;; Which functionality to enable (use t or nil for true and false)
;;----------------------------------------------------------------------------
(setq *macbook-pro-support-enabled* t)
(setq *is-a-mac* (eq system-type 'darwin))
(setq *is-carbon-emacs* (and *is-a-mac* (eq window-system 'mac)))
(setq *is-cocoa-emacs* (and *is-a-mac* (eq window-system 'ns)))
(setq *win32* (eq system-type 'windows-nt) )
(setq *cygwin* (eq system-type 'cygwin) )
(setq *linux* (or (eq system-type 'gnu/linux) (eq system-type 'linux)) )
(setq *unix* (or *linux* (eq system-type 'usg-unix-v) (eq system-type 'berkeley-unix)) )
(setq *linux-x* (and window-system *linux*) )
(setq *xemacs* (featurep 'xemacs) )
(setq *emacs24* (and (not *xemacs*) (or (>= emacs-major-version 24))) )
(setq *no-memory* (cond
  (*is-a-mac*
   (< (string-to-number (nth 1 (split-string (shell-command-to-string "sysctl hw.physmem")))) 4000000000))
  (*linux* nil)
  (t nil)))

;;----------------------------------------------------------------------------
;; Less GC, more memory
;;----------------------------------------------------------------------------
(defun my-optimize-gc (NUM PER)
  "By default Emacs will initiate GC every 0.76 MB allocated (gc-cons-threshold == 800000).
  @see http://www.gnu.org/software/emacs/manual/html_node/elisp/Garbage-Collection.html
  We increase this to 16MB by `(my-optimize-gc 16 0.5)` "
  (setq-default gc-cons-threshold (* 1024 1024 NUM)
    gc-cons-percentage PER))


;;Backups
(setq backup-directory-alist '(("." . "~/.emacs.d/backups")))
(setq delete-old-versions -1)
(setq version-control t)
(setq auto-save-file-name-transforms '((".*" "~/.emacs.d/auto-save-list" t)))

;;window configuration
(when window-system
  (tooltip-mode -1)
  (tool-bar-mode -1)
  (menu-bar-mode t))

;;Sentences end with a single space
(setq sentence-end-double-space nil)

;;change "yes or no" to "y or n"
(fset 'yes-or-no-p 'y-or-n-p)

;;text size
;;(bind-key "C-+" 'text-scale-increase)
;;(bind-key "C--" 'text-scale-decrease)

;; delete trailing whitespace
(add-hook 'before-save-hook 'delete-trailing-whitespace)

;;Tab width of 4 is compact and readable
(setq-default tab-width 4)
(setq tab-width 4)
(setq c-basic-offset 4)

;;hide welcome
(setq inhibit-startup-message t)

;;Don't show whitespace in diff, but show context
(setq vc-diff-switches '("-b" "-B" "-u"))

;;reuse search hotkey
(global-set-key (kbd "C-s") 'isearch-forward-regexp)
(global-set-key (kbd "C-r") 'isearch-backward-regexp)
(global-set-key (kbd "C-M-s") 'isearch-forward)
(global-set-key (kbd "C-M-r") 'isearch-backward)

(require 'init-elpa)

;; Choose either auto-complete or company-mode by commenting one of below two lines!
;; (require 'init-auto-complete) ; after init-yasnippeta to override TAB

(require 'init-auto-complete)
(require 'init-auto-complete-c-headers)
(require 'init-yasnippet)
(require 'init-evil)
(require 'init-color-theme)
(require 'init-dired)
(require 'init-linum-mode)
(require 'init-org)
(require 'init-org-mime)
(custom-set-variables
;; custom-set-variables was added by Custom.
;; If you edit it by hand, you could mess it up, so be careful.
;; Your init file should contain only one such instance.
;; If there is more than one, they won't work right.
'(org-agenda-files (quote ("~/Dropbox/org/work.org"))))
(custom-set-faces
;; custom-set-faces was added by Custom.
;; If you edit it by hand, you could mess it up, so be careful.
;; Your init file should contain only one such instance.
;; If there is more than one, they won't work right.
'(org-done ((t (:foreground "PaleGreen" :weight normal :strike-through t))))
'(org-headline-done ((((class color) (min-colors 16) (background dark)) (:foreground "LightSalmon" :strike-through t)))))
