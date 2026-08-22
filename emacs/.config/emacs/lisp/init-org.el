;;; init-org.el --- Org Mode Configuration -*- lexical-binding: t; -*-

(use-package org
  :ensure nil
  :hook (
	 ;; (org-mode . org-indent-mode)
	 (org-mode . visual-line-mode))
  :config
  (setq org-directory "~/org"
        org-agenda-files '("~/org")

        ;; TODO workflow
        org-todo-keywords '((sequence "TODO(t)" "DONE(d)"))

        ;; Startup
        org-startup-folded 'content
        org-startup-indented nil

        ;; Show Org syntax
        org-hide-leading-stars nil
        org-hide-emphasis-markers nil

	;; Org Capture Templates
	org-capture-templates
	'(("t" "Todo" entry (file+headline "tasks.org" "Tasks")
	   "* TODO  %?\n  %U\n")
	  ("n" "Note" entry (file+datetree "notes.org")
           "* %?\n  %U\n  %i")
	  ("j" "Journal" entry (file+datetree "journal.org")
           "* %U\n  %?"))

        ;; Keep the default "..." when folded
        org-ellipsis "..."
	;; org-ellipsis " ▾"

        ;; Tables
        org-table-auto-align t

        ;; Images
        org-startup-with-inline-images t

        ;; Source blocks
        org-src-preserve-indentation t)

  :custom-face
  (org-level-1 ((t (:height 1.2 :weight bold))))
  (org-level-2 ((t (:height 1.1 :weight bold))))
  (org-level-3 ((t (:height 1.05 :weight bold))))
  (org-level-4 ((t (:height 1.0 :weight bold))))
  (org-level-5 ((t (:height 1.0 :weight bold))))
  (org-level-6 ((t (:height 1.0 :weight bold))))
  (org-level-7 ((t (:height 1.0 :weight bold))))
  (org-level-8 ((t (:height 1.0 :weight bold)))))

(provide 'init-org)
;;; init-org.el ends here
