;; Emacs 24 or later

(require 'cl)
;; (add-to-list 'exec-path "/usr/local/bin")
;; (add-to-list 'exec-path "~/bin")
(add-to-list 'load-path "~/.emacs.d/elisp")
(add-to-list 'load-path "~/.emacs.d/conf")

;;;;;;;;;;;;;;;;;;;;;;;
;;; Package Manager ;;;

;; ELPA `M-x list-packages`
(when (require 'package nil t)
  (add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/"))
  (add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/"))
  (add-to-list 'package-archives '("ELPA" . "http://tromey.com/elpa/"))
  (package-initialize)

  ;; [FIXME] To load packages, uncomment out below line
  ;; (package-refresh-contents)

  ;; Install packages
  (defvar my/favorite-packages
    '(
      hl-line+
      auto-complete
      popup
      rainbow-mode
      yaml-mode
      css-mode
      auto-install
      ac-python
      scala-mode
      org
      flymake-cursor
      ruby-electric
      ruby-block
      session
      csv-mode
      ess
      ;; minibuf-isearch
      ;; migemo
      ))

  (dolist (package my/favorite-packages)
    (unless (package-installed-p package)
      (package-install package)))
  )

;; auto-install
(when (require 'auto-install nil t)
  (setq auto-install-directory "~/.emacs.d/elisp/")
  ;; (auto-install-update-emacswiki-package-name t)
  ;; (setq url-proxy-services '(("http" . "localhost:8339")))
  (auto-install-compatibility-setup))


;;;;;;;;;;;;;;;;;;;;;
;;; Coding System ;;;
(set-language-environment "Japanese")
(prefer-coding-system 'utf-8)

(when (eq system-type 'darwin)
  (when (require 'ucs-normalize nil t)
  (set-file-name-coding-system 'utf-8-hfs)
  (setq locale-coding-system 'utf-8-hfs)))

(when (eq window-system 'w32)
  (set-file-name-coding-system 'cp932)
  (setq locale-coding-system 'cp932))


;;;;;;;;;;;;;;;
;;; GUI/CUI ;;;
(when window-system
  (tool-bar-mode 0)
  (scroll-bar-mode 0))
(unless (eq window-system 'ns)
  (menu-bar-mode 0))


;;;;;;;;;;;;;;;;;;;;
;;; Key Bindings ;;;
(define-key global-map (kbd "C-h") 'delete-backward-char)
(define-key global-map (kbd "C-m") 'newline-and-indent)
(define-key global-map (kbd "C-x C-g") 'goto-line)
(define-key global-map (kbd "M-r") 'replace-string)

;; tmux
(global-set-key "\M-[1;5A" [C-up])
(global-set-key "\M-[1;5B" [C-down])
(global-set-key "\M-[1;5C" [C-right])
(global-set-key "\M-[1;5D" [C-left])

(defun other-window-or-split ()
  "Goto other window, or split window"
  (interactive)
  (when (one-window-p) (split-window-horizontally))
  (other-window 1))
(define-key global-map (kbd "C-t") 'other-window-or-split)

(defun reload-conf ()
  "Reload emacs config"
  (interactive)
  (load "~/.emacs.d/init.el"))
;; (define-key global-map (kbd "") 'reload-conf)


;;;;;;;;;;;;;;;;;
;;; Mode Line ;;;
(column-number-mode t)  ; Column numbers
;; (size-indication-mode t)  ; Filesize
;; (setq display-time-24hr-format t)  ; 24 hour format
;; (setq display-time-day-and-date t)  ; Day and Date
;; (display-time-mode t)  ; Clock
;; (display-battery-mode t)  ; Battery
;; (global-linum-mode t)  ; Always show line numbers (vim-like)

(defun count-lines-and-chars ()
  "
  選択範囲の行数と文字数を表示
  http://d.hatena.ne.jp/sonota88/20110224/1298557375
  "
  (if mark-active
      (format "%d lines,%d chars "
              (count-lines (region-beginning) (region-end))
              (- (region-end) (region-beginning)))
    ""))
(add-to-list 'default-mode-line-format
             '(:eval (count-lines-and-chars)))


;;;;;;;;;;;;;;;
;;; Indents ;;;
(setq-default tab-width 4)
(setq-default indent-tabs-mode nil)
;; (setq indent-line-function 'indent-relative-maybe)


;;;;;;;;;;;;;;
;;; Colors ;;;
(add-hook 'font-lock-mode-hook '(lambda ()
                                  (set-face-foreground 'font-lock-builtin-face "spring green")
                                  (set-face-foreground 'font-lock-comment-face "orange")
                                  (set-face-foreground 'font-lock-string-face  "spring green")
                                  (set-face-foreground 'font-lock-keyword-face "khaki")
                                  (set-face-foreground 'font-lock-constant-face "violet")
                                  (set-face-foreground 'font-lock-function-name-face "hot pink")
                                  (set-face-foreground 'font-lock-variable-name-face "hot pink")
                                  (set-face-foreground 'font-lock-type-face "cyan")
                                  (set-face-foreground 'font-lock-warning-face "magenta")
                                  (set-face-bold-p 'font-lock-function-name-face t)
                                  (set-face-bold-p 'font-lock-warning-face nil)
                                  (set-face-foreground 'minibuffer-prompt "cyan")
                                  ))
(set-face-background 'region "black")


;;;;;;;;;;;;;
;;; Fonts ;;;
;; (set-face-attribute 'default nil
;;                     :family "courier"
;;                     :height 160)


;;;;;;;;;;;;;;;;;;
;;; Highlights ;;;
;; Highlight current line when idle
(when (require 'hl-line+ nil t)
  (toggle-hl-line-when-idle)
  (hl-line-when-idle-interval 10)  ; 10 secs
  (set-face-background 'hl-line "black"))

;; ;; 対応する括弧を強調して表示する (paren-mode)
;; (setq show-paren-delay 0)  ; default 0.125
;; (show-paren-mode t)
;; (setq show-paren-style 'expression)  ; expression: 括弧内も強調表示
;; (set-face-background 'show-paren-match-face nil)
;; (set-face-underline-p 'show-paren-match-face "gray")


;;;;;;;;;;;;;
;;; Dired ;;;

;; (eval-after-load "dired"
;;   '(require 'dired-x))

;; (add-hook 'dired-mode-hook
;;           (lambda ()
;;             (dired-omit-mode 1)))

;; 今日変更されたファイルを強調
(defface my-face-f-2 '((t (:foreground "GreenYellow"))) nil)
(defvar my-face-f-2 'my-face-f-2)
(defun my-dired-today-search (arg)
  "Fontlock search function for dired."
  (search-forward-regexp
   (concat (format-time-string "%b %e" (current-time)) " [0-9]....") arg t))

(add-hook 'dired-mode-hook
          '(lambda ()
             (font-lock-add-keywords
              major-mode
              (list
               '(my-dired-today-search . my-face-f-2)
               ))))

;;;;;;;;;;;;;;;
;;; Backups ;;;
;; Save all backups to ~/.emacs.d/backups/
(add-to-list 'backup-directory-alist
             (cons "." "~/.emacs.d/backups/"))
(setq auto-save-file-name-transforms
      `((".*" ,(expand-file-name "~/.emacs.d/backups/") t)))

(setq auto-save-timeout 15)  ; default 30 sec
(setq auto-save-interval 60)  ; default 300 types


;;;;;;;;;;;;;;;;;;;;;
;;; Auto Complete ;;;
(when (require 'auto-complete-config nil t)
  ;; (add-to-list 'ac-dictionary-directories
  ;;              "~/.emacs.d/elpa/auto-complete-1.4/dict")
  (ac-config-default))

(defun ac-common-setup ()
  (setq ac-sources (append ac-sources '(ac-source-words-in-all-buffer)))
  (setq ac-sources (append ac-sources '(ac-source-files-in-current-dir))))


;;;;;;;;;;;;;;;;;;;;;;;;;
;;; Open Recent Files ;;;
(recentf-mode 1)
(setq recentf-max-menu-items 25)
(define-key global-map (kbd "C-x C-r") 'recentf-open-files)

;; Search recent files by `C-x C-f C-r`
(when (require 'minibuf-isearch nil t))
(when (require 'session nil t))
(add-hook 'after-init-hook 'session-initialize)
(setq history-length 200) ;; そもそものミニバッファ履歴リストの最大長
(setq session-initialize '(de-saveplace session keys menus places)
      session-globals-include '((kill-ring 50)             ;; kill-ring の保存件数
                                (session-file-alist 50 t)  ;; カーソル位置を保存する件数
                                (file-name-history 200)))  ;; ファイルを開いた履歴を保存する件数


;;;;;;;;;;;;;;;
;; Rectangle ;;
(cua-mode t)
(setq cua-enable-cua-keys nil)
;; iTerm2で[C-RET]を拾えないようなので、
;; iTerm2の`Glocal Shortcut Keys`で`C-[RET]`を`Send: ✠`にして対処
;; http://stackoverflow.com/questions/5388562/cant-map-s-cr-in-vim
(define-key global-map (kbd "✠") 'cua-set-rectangle-mark)


;;;;;;;;;;;;
;;; Misc ;;;
(fset 'yes-or-no-p 'y-or-n-p)
(setq echo-keystrokes 0.1)
(setq inhibit-startup-screen t)
;; (setq transient-mark-mode t)

;; ;; シンボリックリンクの読み込みを許可
;; (setq vc-follow-symlinks t)
;; ;; シンボリックリンク先のVCS内で更新が入った場合にバッファを自動更新
;; (setq auto-revert-check-vc-info t)

;; Remove trailing-whitespace
(add-hook 'before-save-hook 'delete-trailing-whitespace)

;; Do not ask "Active processes exist; kill them and exit anyway"
(defadvice save-buffers-kill-emacs (around no-query-kill-emacs activate)
  "Prevent annoying \"Active processes exist\" query when you quit Emacs."
  (flet ((process-list ())) ad-do-it))


;;;;;;;;;;;;;;;;
;; Templates ;;;
(auto-insert-mode)
(setq auto-insert-directory "~/.emacs.d/conf/templates/")


;;;;;;;;;;;;;;;;;;;
;;; Minor Modes ;;;
(load "init-python")
(load "init-cpp")
(load "init-makefile")
(load "init-ruby")
(load "init-js")
(load "init-scala")
(load "init-elisp")
(load "init-shell")
(load "init-css")
(load "init-yaml")
(load "init-tex")
(load "init-orgmode")


;; added by function `customize-face`
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-invalid ((t (:background "red" :foreground "yellow1"))))
 '(flymake-errline ((t (:background "color-52"))))
 '(flymake-warnline ((t (:background "color-19"))))
 '(fringe ((t (:background "black"))))
 '(highlight ((t (:background "darkseagreen4"))))
 '(isearch ((t (:background "color-200" :foreground "brightblue"))))
 '(isearch-fail ((t (:background "color-88"))))
 '(match ((t (:background "yellow4"))))
 '(org-document-info ((t (:foreground "blue"))))
 '(org-document-title ((t (:foreground "blue"))))
 '(org-hide ((t (:foreground "color-235"))))
 '(org-level-1 ((t (:inherit nil :foreground "cyan"))))
 '(org-level-2 ((t (:inherit nil :foreground "blue"))))
 '(org-level-3 ((t (:inherit nil :foreground "brightmagenta"))))
 '(org-level-4 ((t (:inherit nil :foreground "brightmagenta"))))
 '(org-meta-line ((t (:inherit nil :foreground "khaki"))))
 '(org-table ((t (:foreground "brightblue"))))
 '(rst-level-1 ((t (:background "grey20"))))
 '(rst-level-2 ((t (:background "grey10"))))
 '(secondary-selection ((t (:background "yellow4"))))
 '(trailing-whitespace ((t (:background "red4"))))
 '(widget-field ((t (:background "yellow4")))))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )


;; Rainbow-mode
(require 'rainbow-mode)
(add-hook 'css-mode-hook 'rainbow-mode)
(add-hook 'scss-mode-hook 'rainbow-mode)
(add-hook 'php-mode-hook 'rainbow-mode)
(add-hook 'html-mode-hook 'rainbow-mode)

;; ;; migemo
;; ローマ字のまま日本語をインクリメンタル検索 `$ brew install cmigemo`
;; (when (locate-library "migemo") (require 'migemo))

;; ;; Helm
;; (when (require 'helm-config nil t)
;;   (helm-mode 1)
;;   ;; 自動補完を無効
;;   ;; (custom-set-variables '(helm-ff-auto-update-initial-value nil))
;;   ;; C-hでバックスペースと同じように文字を削除
;;   (define-key helm-c-read-file-map (kbd "C-h") 'delete-backward-char)
;;   ;; TABで任意補完。選択肢が出てきたらC-nやC-pで上下移動してから決定することも可能
;;   (define-key helm-c-read-file-map (kbd "TAB") 'helm-execute-persistent-action)
;;   )
