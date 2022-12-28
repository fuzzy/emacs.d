(use-package elpy
  :straight t
  :ensure t
  :init
  (elpy-enable))

(add-hook 'elpy-mode-hook (lambda ()
                            (add-hook 'before-save-hook
                                      'elpy-black-fix-code nil t)))

;; (use-package anaconda-mode
;;   :straight t
;;   :hook
;;   (python-mode-hook . anaconda-mode)
;;   (python-mode-hook . anaconda-eldoc-mode))

(provide 'init-python)
