(setq package-list '(d-mode company-dcd))

(dolist (package package-list)
  (unless (package-installed-p package)
    (package-install package)))

(require 'd-mode)
(require 'company-dcd)
(add-hook 'd-mode-hook 'company-dcd-mode)

(provide 'init-dlang)
