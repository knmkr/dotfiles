;;;;;;;;;;;;;;
;;; Golang ;;;

;; $ go get github.com/rogpeppe/godef
;; $ go get github.com/golang/lint
;; $ go get -u github.com/nsf/gocode

(add-to-list 'exec-path (expand-file-name "~/.go/bin"))

(add-hook 'go-mode-hook (lambda()
                          ;; gofmt
                          (add-hook 'before-save-hook 'gofmt-before-save)
                          ;; godef
                          (local-set-key (kbd "M-.") 'godef-jump)
                          ))

;; golint
(add-to-list 'load-path (concat (getenv "GOPATH") "/src/github.com/golang/lint/misc/emacs"))
(when (require 'golint nil t))

;; gocode, go-autocomplete
(eval-after-load "go-mode"
  '(progn
     (require 'go-autocomplete)))
