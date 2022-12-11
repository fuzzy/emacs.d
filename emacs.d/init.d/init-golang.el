(setq exec-path (append '(concat (getenv "HOME") "/.runtimes/go/path/bin") exec-path))
(setenv "PATH" (concat (getenv "HOME") "/.runtimes/go/path/bin:" (getenv "PATH")))

(use-package projectile
  :straight t
  :config
  ; Use projectile-test-project in place of 'compile'; assign whatever key you want.
  (global-set-key [f9] 'projectile-test-project)
  ; "projectile" recognizes git repos (etc) as "projects" and changes settings
  ; as you switch between them.
  (projectile-global-mode 1))

(use-package go-projectile
  :straight t)

(use-package flycheck
  :straight t
  :hook ((after-init-hook . global-flycheck-mode)))

(use-package gotest
  :straight t)

(use-package lsp-mode
  :straight t)

(use-package lsp-ui
  :straight t)

(use-package company
  :straight t
  :config
  (setq company-idle-delay 0)
  (setq company-minimum-prefix-length 1))

(use-package company-go
  :straight t
  :hook ((go-mode-hook . my-company-go-mode-hook)))

(use-package go-mode
  :straight t
  :config
  (setq gofmt-command "goimports")
  (autoload 'go-mode "go-mode" nil t)
  :mode ("\\.go$" . 'go-mode))

(defun my-company-go-mode-hook ()
  (company-mode)
  (set (make-local-variable 'company-backends) '(company-go)))

(defun my-go-mode-hook ()
  (setq tab-width 2 indent-tabs-mode 1)
                                        ; eldoc shows the signature of the function at point in the status bar.
  (go-eldoc-setup)
  (local-set-key (kbd "M-.") #'godef-jump)
  (add-hook 'before-save-hook 'gofmt-before-save)
                                        ; extra keybindings from https://github.com/bbatsov/prelude/blob/master/modules/prelude-go.el
  (let ((map go-mode-map))
    (define-key map (kbd "C-c a") 'go-test-current-project) ;; current package, really
    (define-key map (kbd "C-c m") 'go-test-current-file)
    (define-key map (kbd "C-c .") 'go-test-current-test)
    (define-key map (kbd "C-c b") 'go-run)))

(add-hook 'go-mode-hook 'my-go-mode-hook)
(add-hook 'go-mode-hook #'lsp-deferred)
(add-hook 'go-mode-hook #'yas-minor-mode)

(require 'compile)
(dolist (elt go-test-compilation-error-regexp-alist-alist)
  (add-to-list 'compilation-error-regexp-alist-alist elt))
(defun prepend-go-compilation-regexps ()
  (dolist (elt (reverse go-test-compilation-error-regexp-alist))
    (add-to-list 'compilation-error-regexp-alist elt t)))
(add-hook 'go-mode-hook 'prepend-go-compilation-regexps)

(provide 'init-golang)
