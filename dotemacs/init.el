;;Personal information
(setq user-full-name "Fantity Wei"
	  user-mail-address "weimenlove@gmail.com")

;;Emacs Initialization
(add-to-list 'load-path "~/.emacs.d/lisp")
;;(add-to-list 'load-path "~/elisp")

;;Backups
(setq backup-directory-alist '(("." . "~/.emacs.d/backups")))
(setq delete-old-versions -1)
(setq version-control t)
(setq auto-save-file-name-transforms '((".*" "~/.emacs.d/auto-save-list" t)))

;;window configuration
(when window-system
  (tooltip-mode -1)
  (tool-bar-mode -1)
  (menu-bar-mode -1))

;;Sentences end with a single space
(setq sentence-end-double-space nil)

;;change "yes or no" to "y or n"
(fset 'yes-or-no-p 'y-or-n-p)

;;text size
;;(bind-key "C-+" 'text-scale-increase)
;;(bind-key "C--" 'text-scale-decrease)

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

; start auto-complete with emacs
(require 'auto-complete)
; do default config for auto-complete
(require 'auto-complete-config)
(ac-config-default)

(require 'init-yasnippet)
; let's define a function which initializas auto-complete-c-headers
; and gets called for c/c++ hooks
(defun my:ac-c-header-init()
  (require 'auto-complete-c-headers)
  (add-to-list 'ac-sources 'ac-source-c-headers)
  (add-to-list 'achead:include-directories '"/usr/include/c++/4.7")
  (add-to-list 'achead:include-directories '"/usr/include/c++/4.7/i486-linux-gnu")
  (add-to-list 'achead:include-directories '"/usr/include/c++/4.7/backward")
  (add-to-list 'achead:include-directories '"/usr/lib/gcc/i486-linux-gnu/4.7/include")
  (add-to-list 'achead:include-directories '"/usr/local/include")
  (add-to-list 'achead:include-directories '"/usr/lib/gcc/i486-linux-gnu/4.7/include-fixed")
  (add-to-list 'achead:include-directories '"/usr/include/i386-linux-gnu")
  (add-to-list 'achead:include-directories '"/usr/include")
)

; now let's call this function from c/c++ hooks
(add-hook 'c-mode-hook 'my:ac-c-header-init)
(add-hook 'c++-mode-hook 'my:ac-c-header-init)

(require 'evil)
(evil-mode 1)

;;Show column number
(global-linum-mode 1) ; always show line numbers
(require 'linum-relative)
(linum-relative-on)
