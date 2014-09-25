;; use TAB in Makefile
(setq-default indent-tabs-mode nil)
(add-hook 'makefile-mode-hook
          (function (lambda ()
                      (setq indent-tabs-mode t))))
