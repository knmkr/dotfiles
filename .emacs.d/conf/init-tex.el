;; reftex-mode
(add-hook 'latex-mode-hook 'turn-on-reftex) ; with Emacs latex mode
(add-hook 'LaTeX-mode-hook 'turn-on-reftex) ; with AUCTeX LaTeX mode
(add-hook 'yatex-mode-hook 'turn-on-reftex) ; with YaTeX mode

;;
(add-hook 'org-mode-hook 'turn-on-reftex)
