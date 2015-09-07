
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

(provide 'init-auto-complete-c-headers)
