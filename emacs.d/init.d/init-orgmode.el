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

(use-package org-pomodoro
  :straight t
  :init
  (define-key thwap-map (kbd "C-p p") 'org-pomodoro))

(use-package org-kanban
  :straight t
  :init
  (define-key thwap-map (kbd "C-o C-s") 'org-kanban/initialize-at-beginning)
  (define-key thwap-map (kbd "C-o C-e") 'org-kanban/initialize-at-end)
  (define-key thwap-map (kbd "C-o C-h") 'org-kanban/initialize-here)
  :ensure t)

;; ob-http is needed to run http calls inside org-mode
(use-package ob-http
  :straight t
  :ensure t)
;; (setq geiser-default-implementation 'guile)

;; TODO FIXME this defun needs to be deleted
;; the org-mode has removed org-babel-get-header
;; ob-sh needs to update to use the new version.
(defun org-babel-get-header (params key &optional others)
  (delq nil
        (mapcar
         (lambda (p) (when (funcall (if others #'not #'identity) (eq (car p) key)) p))
         params)))

(setq org-latex-create-formula-image-program 'imagemagick)

;; DO NOT set up ditaa.  It breaks (helm-find-files) C-x C-f
;;(ditaa . t)
;;(setq org-ditaa-jar-path "/usr/share/java/ditaa/ditaa-0_9.jar")
;; display inline images in org-mode
;;(add-hook 'org-babel-after-execute-hook 'org-display-inline-images 'append)

(add-hook 'org-mode-hook #'turn-on-font-lock)
(global-set-key (kbd "C-c l") #'org-store-link)
(global-set-key (kbd "C-c a") #'org-agenda)
(global-set-key (kbd "C-c c") #'org-capture)


;; Taken pretty much verbatim from: https://emacs.cafe/emacs/orgmode/gtd/2017/06/30/orgmode-gtd.html
;; STANDARD keybindings, no need to use the THWAPmap
;; C-c c t  ==  Add an entry to the INBOX
;; C-c c T  ==  Add an entry to the TICKLER
;; C-c C-w  ==  Re-file INBOX entry to the proper place
;; C-c C-c  ==  When on a headline, add tag to said headline
;; C-c C-t  ==  Set / Cycle the TODO keyword
;; C-c C-s  ==  Set a schedule date/time on an entry
;; C-c C-d  ==  Set a deadline date/time on an entry

(setq org-agenda-files (list "~/gtd/inbox.org"
                             "~/gtd/someday.org"
                             "~/gtd/tickler.org"
                             "~/gtd/project.org"))

(setq org-capture-templates '(("t" "Todo [inbox]" entry
                               (file+headline "~/gtd/inbox.org" "Tasks")
                               "* TODO %i%?")
                              ("T" "Tickler" entry
                               (file+headline "~/gtd/tickler.org" "Tickler")
                               "* %i%? \n %U")))

(setq org-refile-targets (quote (("~/gtd/someday.org" :level . 1)
                                 ("~/gtd/tickler.org" :maxlevel . 2)
                                 ("~/gtd/project.org" :maxlevel . 3))))

;; (setq org-refile-targets '((nil :maxlevel . 9)
;;                            (org-agenda-files :maxlevel . 9)))
(setq org-outline-path-complete-in-steps nil)         ; Refile in a single go
(setq org-refile-use-outline-path t)                  ; Show full paths for refiling

(setq org-todo-keywords '((sequence "TODO(t)" "INPROGRESS(i)" "WAITING(w)" "|" "DONE(d)" "CANCELLED(c)")))

(setq org-agenda-custom-commands
      '(("o" "At the office" tags-todo "@office"
         ((org-agenda-overriding-header "Office")
          (org-agenda-skip-function #'my-org-agenda-skip-all-siblings-but-first)))))

(defun my-org-agenda-skip-all-siblings-but-first ()
  "Skip all but the first non-done entry."
  (let (should-skip-entry)
    (unless (org-current-is-todo)
      (setq should-skip-entry t))
    (save-excursion
      (while (and (not should-skip-entry) (org-goto-sibling t))
        (when (org-current-is-todo)
          (setq should-skip-entry t))))
    (when should-skip-entry
      (or (outline-next-heading)
          (goto-char (point-max))))))

(defun org-current-is-todo ()
  (string= "TODO" (org-get-todo-state)))

(provide 'init-orgmode)
