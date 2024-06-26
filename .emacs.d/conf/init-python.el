;;;;;;;;;;;;;;
;;; Python ;;;

;; Template
(define-auto-insert "\\.py" "python-template.py")

;; NOTE:
;; Emacs bulk indent for Python
;; With python-mode, after marking the block of code,
;;   * C-c > shifts the region 4 spaces to the right
;;   * C-c < shifts the region 4 spaces to the left

;; TODO:
;; python auto-complete
;; (when (require 'ac-python nil t))


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
;; Install
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
;; http://yukke.hateblo.jp/entry/2015/01/09/222311
(add-hook 'find-file-hook 'flymake-find-file-hook)
(when (load "flymake" t)
  (defun flymake-pyflakes-init ()
    (let* ((temp-file (flymake-init-create-temp-buffer-copy
                       'flymake-create-temp-inplace))
           (local-file (file-relative-name
                        temp-file
                        (file-name-directory buffer-file-name))))
      (list "pychecker" (list local-file))))  ; ~/.emacs.d/elisp/flymake/pychecker
  (add-to-list 'flymake-allowed-file-name-masks
               '("\\.py\\'" flymake-pyflakes-init)))

(defun flymake-show-help ()
  (when (get-char-property (point) 'flymake-overlay)
    (let ((help (get-char-property (point) 'help-echo)))
      (if help (message "%s" help)))))
(add-hook 'post-command-hook 'flymake-show-help)
(global-set-key [f10] 'flymake-goto-prev-error)
(global-set-key [f11] 'flymake-goto-next-error)


;; Jedi.el - Python auto-completion for Emacs
;;
;; Install
;;
;; 1. Run `M-x jedi:install-server`
;;
;; http://qiita.com/yuizho/items/4c121bdecc103109e4fd
;;
;; (when (require 'jedi nil t)
;;   (add-hook 'python-mode-hook 'jedi:setup)
;;   (setq jedi:complete-on-dot t)

;;   (when (require 'virtualenvwrapper)
;;     (when (require 'auto-virtualenvwrapper)
;;       (add-hook 'python-mode-hook #'auto-virtualenvwrapper-activate)
;;       )
;;     )

;;   (define-key python-mode-map "M-m" 'jedi:goto-definition)
;;   (define-key python-mode-map "M-i" 'jedi:goto-definition-pop-marker)
;; )


;; google/yapf -- A formatter for Python files
;;
;; Install
;;
;; 1. $ pip install yapf
;;
;; https://github.com/paetzke/py-yapf.el
;;
;; (when (require 'py-yapf nil t)
;;   (add-hook 'python-mode-hook 'py-yapf-enable-on-save)
;;   )


;; isort
(when (require 'py-isort nil t)
  ;; (setq py-isort-options '("--skip-glob='**/migrations/*'"))
  ;; (setq py-isort-options '("--lines=88"))
  ;; (setq py-isort-options '("--multi-line=3"))
  ;; (setq py-isort-options '("--force-sort-within-sections"))
  (add-hook 'before-save-hook 'py-isort-before-save)
  )


;; black
;; (when (require 'blacken nil t)
;;   (add-hook 'python-mode-hook 'blacken-mode)
;;   )


;; ;; Elpy
;; (when (require 'elpy nil t)
;;   (elpy-enable)

;;   ;; https://elpy.readthedocs.io/en/latest/customization_tips.html#jumping-to-assignment
;;   (define-key elpy-mode-map (kbd "M-.") 'elpy-goto-assignment)
;;   )


;; ;; importmagic
;; ;; https://github.com/anachronic/importmagic.el
;; (when (require 'importmagic nil t)
;;   (add-hook 'python-mode-hook 'importmagic-mode)
;;   ;; FIXME
;;   (setq importmagic-python-interpreter "/Users/ken/.local/share/virtualenvs/.emacs.d-et_VfsHo/bin/python")

;;   (define-key importmagic-mode-map (kbd "M-i") 'importmagic-fix-symbol-at-point)
;;   )


;; Inset import pdb; pdb.set_trace() on C-x, C-p
;; https://gist.github.com/amitsaha/7717679
(defun pdb-set-trace ()
  ;; http://www.emacswiki.org/emacs/InteractiveFunction
  (interactive)
  (insert "import pdb; pdb.set_trace()\n"))
(global-set-key [(control ?x) (control ?p)] 'pdb-set-trace)
