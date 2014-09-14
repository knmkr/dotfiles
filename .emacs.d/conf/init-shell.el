;;;;;;;;;;;;;;;;;;
;; Shell Script ;;

;; Template
(define-auto-insert "\\.sh" "bash-template.sh")

;;
(autoload '-mode "shell-script-mode" nil t)
(add-to-list 'auto-mode-alist '("\\.zshrc" . shell-script-mode))
