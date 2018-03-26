;; TODO
;; (autoload 'js2-mode "js2-mode" nil t)
;; (add-to-list 'auto-mode-alist '("\\.js$" . js2-mode))

(setq js-indent-level 2)

(add-to-list 'auto-mode-alist '(".*\\.js\\'" . rjsx-mode))
;; (add-to-list 'auto-mode-alist '("components\\/.*\\.js\\'" . rjsx-mode))
;; (add-to-list 'auto-mode-alist '("containers\\/.*\\.js\\'" . rjsx-mode))
