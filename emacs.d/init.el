;; Borrowing heavily from https://github.com/bradwright/emacs-d
(global-set-key "\C-q" 'execute-extended-command)

;; base load path
(setq dotfiles-dir "~/.emacs.d/init.d/")
(add-to-list 'load-path dotfiles-dir)

;; Basic paths and variables other things need
(require 'init-defaults)
(require 'init-interface)
(require 'init-keymap)
(require 'init-magit)
(require 'init-golang)
(require 'init-python)

;;;(require 'init-packages)
;;;(require 'init-dash)
;;;(require 'init-transient)
;;;(require 'init-with-editor)
;;;(require 'init-magit)
;;;(require 'init-helm)
;;;(require 'init-org)
;;;(require 'init-company)
;;;(require 'init-lsp-mode)
;;;(require 'init-markups)
;;;(require 'init-automation)
;;;(require 'init-programming)
;;;
;;;
;;;

;; ;; below here is extra stuff like this
;; (custom-set-variables
;;  ;; custom-set-variables was added by Custom.
;;  ;; If you edit it by hand, you could mess it up, so be careful.
;;  ;; Your init file should contain only one such instance.
;;  ;; If there is more than one, they won't work right.
;;  '(display-time-mode t)
;;  '(global-display-line-numbers-mode t)
;;  '(inhibit-startup-screen t)
;;  '(show-paren-mode t)
;;  '(tool-bar-mode nil))
;; (custom-set-faces
;;  ;; custom-set-faces was added by Custom.
;;  ;; If you edit it by hand, you could mess it up, so be careful.
;;  ;; Your init file should contain only one such instance.
;;  ;; If there is more than one, they won't work right.
;;  '(default ((t (:family "Source Code Pro" :foundry "ADBO" :slant normal :weight normal :height 83 :width normal)))))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   '(magit bind-key use-package undo-tree markdown-mode magit-find-file json-mode idomenu ido-vertical-mode go-mode flymake-go flymake-cursor flx-ido expand-region eproject csv-mode browse-kill-ring)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
