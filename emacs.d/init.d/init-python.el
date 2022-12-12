(use-package anaconda-mode
  :straight t
  :hook
  (python-mode-hook . anaconda-mode)
  (python-mode-hook . anaconda-eldoc-mode))

(provide 'init-python)
