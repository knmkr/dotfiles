(setq org-hide-leading-stars t)

;; org-agenda
(setq org-agenda-files '("~/Dropbox/Documents/todo.org"))
(define-key global-map (kbd "C-c a") 'org-agenda)

;; org-remember
;; (org-remember-insinuate)
(define-key global-map (kbd "C-c r") 'org-remember)

;; org-export-latex
;;
;; reference: LaTeX Export for Org Mode < 8.0
;;            (http://orgmode.org/worg/org-tutorials/org-latex-export.html)
(when (require 'org-latex nil t))
;; (setq org-export-latex-coding-system 'utf-8)
;; (setq org-export-latex-date-format "%Y-%m-%d")

;; LaTeX Document Classes
(unless (boundp 'org-export-latex-classes)
  (setq org-export-latex-classes nil))
;; (add-to-list 'org-export-latex-classes
;;              '("article"
;;                "\\documentclass{article}"
;;                ("\\section{%s}" . "\\section*{%s}")))
(add-to-list 'org-export-latex-classes
             '("article"
               "\\documentclass{article}"
               ("\\section{%s}" . "\\section*{%s}")
               ("\\subsection{%s}" . "\\subsection*{%s}")
               ("\\subsubsection{%s}" . "\\subsubsection*{%s}")
               ("\\paragraph{%s}" . "\\paragraph*{%s}")
               ("\\subparagraph{%s}" . "\\subparagraph*{%s}")))
(add-to-list 'org-export-latex-classes
             '("book"
               "\\documentclass{book}"
               ("\\part{%s}" . "\\part*{%s}")
               ("\\chapter{%s}" . "\\chapter*{%s}")
               ("\\section{%s}" . "\\section*{%s}")
               ("\\subsection{%s}" . "\\subsection*{%s}")
               ("\\subsubsection{%s}" . "\\subsubsection*{%s}")))
(add-to-list 'org-export-latex-classes
             '("koma-article"
               "\\documentclass{scrartcl}"
               ("\\section{%s}" . "\\section*{%s}")
               ("\\subsection{%s}" . "\\subsection*{%s}")
               ("\\subsubsection{%s}" . "\\subsubsection*{%s}")
               ("\\paragraph{%s}" . "\\paragraph*{%s}")
               ("\\subparagraph{%s}" . "\\subparagraph*{%s}")))

;; Japanese Article
(add-to-list 'org-export-latex-classes
             '("jsarticle"
               "\\documentclass[a4j]{jsarticle}"
               ("\\section{%s}" . "\\section*{%s}")
               ("\\subsection{%s}" . "\\subsection*{%s}")
               ("\\subsubsection{%s}" . "\\subsubsection*{%s}")
               ("\\paragraph{%s}" . "\\paragraph*{%s}")
               ("\\subparagraph{%s}" . "\\subparagraph*{%s}")))
(setq org-export-latex-packages-alist
      '(("AUTO" "inputenc"  t)
        ("T1"   "fontenc"   t)
        ))



;; ;;
;; ;; ditta (DIagrams Through Ascii Art)
;; ;
;; (org-babel-do-load-languages
;;  'org-babel-load-languages
;;  '((ditaa . t))) ; this line activates ditaa
;; ;
;; (setq org-ditaa-jar-path "~/.emacs.d/elisp/elisp.d/org-mode/contrib/scripts/ditaa.jar")


;;
;; (add-to-list 'load-path "~/.emacs.d/elisp/elisp.d/org-mode")
;; (add-to-list 'load-path "~/.emacs.d/elisp/elisp.d/org-mode/lisp/")

;; Colors. Highlight LaTeX syntax
(make-face 'org-latex-green)
(set-face-foreground 'org-latex-green "green")
(font-lock-add-keywords 'org-mode '(
                                    ("\\\\.*{.*}" . 'org-latex-green)
                                    ("\\\\.*" . 'font-lock-keyword-face)
                                    ("　" . 'trailing-whitespace)
                                    ("[ \t]+$" . 'trailing-whitespace)
                                    ))
