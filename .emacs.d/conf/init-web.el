(when (require 'web-mode nil t)

  (add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))
  (setq web-mode-engines-alist '(("django" . "\\.html\\'")))

  ;; auto-close with `</`
  (setq web-mode-enable-auto-pairing t)
  (setq web-mode-enable-auto-closing t)

  ;; highlight current element/column
  (setq web-mode-enable-current-element-highlight t)
  (setq web-mode-enable-current-column-highlight t)

  ;; (add-to-list 'auto-mode-alist '("\\.js?\\'" . web-mode))
  ;; (add-to-list 'auto-mode-alist '("\\.css?\\'" . web-mode))

  ;; (setq web-mode-markup-indent-offset 2)
  ;; (setq web-mode-code-indent-offset 2)
  (setq web-mode-css-indent-offset 2)

  (setq-default indent-tabs-mode nil)
)
