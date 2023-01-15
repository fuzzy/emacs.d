(use-package org-mind-map
  :straight t
  :init
  (require 'ox-org)
  (define-key thwap-map (kbd "C-m m") 'org-mind-map-write)
  (define-key thwap-map (kbd "C-m c") 'org-mind-map-write-current-tree)
  :ensure t
  :config
  (setq org-mind-map-engine "dot")       ; Default. Directed Graph
  ;; (setq org-mind-map-engine "neato")  ; Undirected Spring Graph
  ;; (setq org-mind-map-engine "twopi")  ; Radial Layout
  ;; (setq org-mind-map-engine "fdp")    ; Undirected Spring Force-Directed
  ;; (setq org-mind-map-engine "sfdp")   ; Multiscale version of fdp for the layout of large graphs
  ;; (setq org-mind-map-engine "circo")  ; Circular Layout
  )

(use-package org-bullets
  :straight t
  :init
  (add-hook 'org-mode-hook (lambda () (org-bullets-mode 1))))

(provide 'init-orgmode)
