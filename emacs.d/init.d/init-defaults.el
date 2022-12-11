;; Turn off mouse interface early in startup to avoid momentary flash
;; of things I don't want.
(progn
  (dolist (mode '(menu-bar-mode tool-bar-mode scroll-bar-mode))
    (when (fboundp mode) (funcall mode -1))))

;; Don't show the splash screen
(setq inhibit-startup-screen t
      ;; Show the *scratch* on startup
      initial-buffer-choice nil)

;; I got sick of typing "yes"
(defalias 'yes-or-no-p 'y-or-n-p)

;; I prefer spaces over tabs
(setq-default
 indent-tabs-mode nil
 ;; ... and I prefer 2-space indents
 tab-width 2)

(setq package-archives
      '(("gnu"       . "http://elpa.gnu.org/packages/")
        ("org"       . "https://orgmode.org/elpa/")
        ;; ("marmalade" . "http://marmalade-repo.org/packages/")
        ("melpa"     . "http://melpa.org/packages/")))


;; a few little niceities
(global-auto-revert-mode t)
(xterm-mouse-mode)
(add-hook 'write-file-hooks 'delete-trailing-whitespace)
(setq save-interprogram-paste-before-kill t)
(setq require-final-newline t)


;; UTF-8 please
(prefer-coding-system       'utf-8)
(set-default-coding-systems 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(setq default-buffer-file-coding-system 'utf-8)


(defun enable-hl-line-mode ()
  "Enables hl-line-mode"
  (interactive)
  (hl-line-mode 1))

;; enable hl-line-mode for prog-mode
(add-hook 'prog-mode-hook 'enable-hl-line-mode)

(electric-pair-mode 1)
(setq backup-directory-alist `(("." . "~/.emacs.d/saves")))

(defun turn-on-electric-indent-mode ()
  "Turns on electric-indent-mode"
  (interactive)
  (electric-indent-mode 1))

(defun turn-off-electric-indent-mode ()
  "Turns off electric-indent-mode"
  (interactive)
  (electric-indent-mode -1))

;; turn on electric-indent-mode
(add-hook 'prog-mode-hook 'turn-on-electric-indent-mode)

;; (let ((current-prefix-arg 40)) ;; emulate C-u 40
;;   (call-interactively 'split-window-right))
(package-refresh-contents)
(setq elpa-package-list '(bind-key ;; this is required by use-package, but isn't auto-installed
                          use-package))
                          ;; browse-kill-ring
                          ;; eproject
                          ;; expand-region
                          ;; flx-ido ;; flx is included as a dependency
                          ;; flymake-cursor
                          ;; flymake-go
                          ;; go-mode
                          ;; ido-vertical-mode
                          ;; idomenu
                          ;; json-mode
                          ;; magit
                          ;; magit-find-file
                          ;; markdown-mode
                          ;; undo-tree
                          ;; org-pretty-tags
                          ;; org-fancy-priorities
                          ;; use-package))


;; standard package installation support
(require 'package)
(package-refresh-contents t)
(package-initialize t)

(dolist (pkg-name elpa-package-list)
  (package-install pkg-name))

(require 'package nil t)

;; straight-use-package support
(eval-when-compile
  (require 'use-package))
(defvar bootstrap-version)
(let ((bootstrap-file
       (expand-file-name "straight/repos/straight.el/bootstrap.el" user-emacs-directory))
      (bootstrap-version 5))
  (unless (file-exists-p bootstrap-file)
    (with-current-buffer
        (url-retrieve-synchronously
         "https://raw.githubusercontent.com/raxod502/straight.el/develop/install.el"
         'silent 'inhibit-cookies)
      (goto-char (point-max))
      (eval-print-last-sexp)))
  (load bootstrap-file nil 'nomessage))
(straight-use-package 'use-package)

(use-package better-defaults
  :straight t)

(use-package yasnippet
  :straight t
  :config (yas-global-mode 1))

(use-package auto-complete
  :straight t
  :config (ac-config-default))

(use-package neotree
  :straight t)

(use-package powerline
  :straight t
  :config
  (powerline-center-theme)
  (setq powerline-arrow-shape 'arrow))

(use-package yaml-mode
  :straight t)

(provide 'init-defaults)
