(add-hook 'c-mode-common-hook
          '(lambda ()
             ;; type `;` then newline-and-indent
             (c-toggle-auto-hungry-state 1)
             ;; RET as newline-and-indent
             (define-key c-mode-base-map "\C-m" 'newline-and-indent)
             (setq tab-width 4)

             (c-set-style "linux")
             (setq c-basic-offset tab-width)
             (c-set-offset 'access-label '0)

             (define-key c-mode-base-map "\"" 'electric-pair)
             (define-key c-mode-base-map "\'" 'electric-pair)
             (define-key c-mode-base-map "(" 'electric-pair)
             (define-key c-mode-base-map "[" 'electric-pair)
             (define-key c-mode-base-map "{" 'electric-pair)

             (flymake-mode t)
             ))
