; custom keymap stuff
(define-prefix-command 'thwap-map)
(global-set-key (kbd "C-t") 'thwap-map)
(define-key thwap-map (kbd "c") 'comment-or-uncomment-region)
(define-key thwap-map (kbd "g s") 'magit-status)
(define-key thwap-map (kbd "C-i") 'neotree-toggle)
(define-key thwap-map (kbd "C-w") 'wttrin)
(define-key thwap-map (kbd "<up>") 'windmove-up)
(define-key thwap-map (kbd "<down>") 'windmove-down)
(define-key thwap-map (kbd "<left>") 'windmove-left)
(define-key thwap-map (kbd "<right>") 'windmove-right)
;; org keys
(define-key thwap-map (kbd "C-o l") 'org-store-link)
(define-key thwap-map (kbd "C-o a") 'org-agenda)
(define-key thwap-map (kbd "C-o c c") 'org-capture)
(define-key thwap-map (kbd "C-o c f") 'org-capture)
(define-key thwap-map (kbd "C-o c r") 'org-capture)
(define-key thwap-map (kbd "C-o c k") 'org-capture)


(provide 'init-keymap)
