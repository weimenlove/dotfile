(setq evil-symbol-word-search t)

(require 'evil)

;; @see https://bitbucket.org/lyro/evil/issue/342/evil-default-cursor-setting-should-default
;; cursor is alway black because of evil
;; here is the workaround
(setq evil-default-cursor t)

;; enable evil-mode
(evil-mode 1)

(define-key evil-ex-completion-map (kbd "M-p") 'previous-complete-history-element)
(define-key evil-ex-completion-map (kbd "M-n") 'next-complete-history-element)

(define-key evil-normal-state-map (kbd "j") 'evil-next-visual-line)
(define-key evil-normal-state-map (kbd "k") 'evil-previous-visual-line)

(provide 'init-evil)
