;;;;;;;;;;;;;;
;;; Python ;;;

;; Template
(define-auto-insert "\\.py" "python-template.py")

;; TODO:
;; python auto-complete
;; (when (require 'ac-python nil t))

;; NOTE: somehow Jedi causes kernel panic when terminating emacs...
;; Jedi.el - Python auto-completion for Emacs
;; (add-to-list 'load-path "~/.emacs.d/elisp/emacs-jedi")
;; (when (require 'jedi nil t)
;;   (add-hook 'python-mode-hook 'jedi:setup)
;;   (setq jedi:complete-on-dot t)

;;   (defun jedi:stop-all-servers ()
;;     (maphash (lambda (_ mngr) (epc:stop-epc mngr))
;;              jedi:server-pool--table))
;;   (add-hook 'kill-emacs-hook #'jedi:stop-all-servers)
;;   )
;; (autoload 'jedi:setup "jedi" nil t)


;; Colors
(font-lock-add-keywords 'python-mode '(
                                       ("log\\.debug" . 'font-lock-keyword-face)
                                       ("log\\.info" . 'font-lock-keyword-face)
                                       ("log\\.warn" . 'font-lock-keyword-face)
                                       ("log\\.error" . 'font-lock-keyword-face)
                                       ("log\\.critical" . 'font-lock-keyword-face)
                                        ;  ("　" . 'trailing-whitespace)
                                        ;  ("[ \t]+$" . 'trailing-whitespace)
                                       ))

;; Electric Pair
(add-hook 'python-mode-hook
          (lambda ()
            (define-key python-mode-map "\"" 'electric-pair)
            (define-key python-mode-map "\'" 'electric-pair)
            (define-key python-mode-map "(" 'electric-pair)
            (define-key python-mode-map "[" 'electric-pair)
            (define-key python-mode-map "{" 'electric-pair)))
(defun electric-pair ()
  "Insert character pair without sournding spaces
  http://d.hatena.ne.jp/cou929_la/20110525/1306321857
  "
  (interactive)
  (let (parens-require-spaces)
    (insert-pair)))

;; Flymake
;;
;; 1. $ pip install pyflakes pep8
;; 2. $ cat ~/.emacs.d/elisp/flymake/pychecker
;;    #!/bin/bash
;;
;;    pyflakes "$1"
;;    pep8 --ignore=E221,E701,E202,E501,E231,E303 --repeat "$1"
;;    true
;; 3. $ chmod 755 ~/.emacs.d/elisp/flymake/pychecker
;;
;; http://d.hatena.ne.jp/cou929_la/20110525/1306321857
(add-hook 'find-file-hook 'flymake-find-file-hook)
(when (load "flymake" t)
  (defun flymake-pyflakes-init ()
    (let* ((temp-file (flymake-init-create-temp-buffer-copy
                       'flymake-create-temp-inplace))
           (local-file (file-relative-name
                        temp-file
                        (file-name-directory buffer-file-name))))
      (list "pychecker"  (list local-file))))  ;~/.emacs.d/elisp/flymake/pychecker
  (add-to-list 'flymake-allowed-file-name-masks
               '("\\.py\\'" flymake-pyflakes-init)))
(load-library "flymake-cursor")
(global-set-key [f10] 'flymake-goto-prev-error)
(global-set-key [f11] 'flymake-goto-next-error)


;; FIXME: jedi causes crush
;; ;; jedi
;; (add-to-list 'load-path "~/.emacs.d/elisp/jedi/emacs-deferred")
;; (add-to-list 'load-path "~/.emacs.d/elisp/jedi/emacs-epc")
;; (add-to-list 'load-path "~/.emacs.d/elisp/jedi/emacs-ctable")
;; (add-to-list 'load-path "~/.emacs.d/elisp/jedi/emacs-jedi")
;; (require 'auto-complete-config)
;; (require 'python)
;; (require 'jedi)
;; (add-hook 'python-mode-hook 'jedi:setup)
;; ;; (define-key python-mode-map (kbd "<C-tab>") 'jedi:complete)
;; (setq jedi:complete-on-dot t)
