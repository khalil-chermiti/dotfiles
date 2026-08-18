;;; init-org.el --- Org Mode Configuration -*- lexical-binding: t; -*-

(use-package org
  :ensure nil
  :hook ((org-mode . org-indent-mode)
         (org-mode . visual-line-mode))
  :config
  (setq org-directory "~/org"
        org-agenda-files '("~/org")

        ;; TODO workflow
        org-todo-keywords '((sequence "TODO(t)" "DONE(d)"))

        ;; Better editing
        org-startup-indented t
        org-startup-folded 'content

        ;; Tables
        org-table-auto-align t

        ;; Images
        org-startup-with-inline-images t

        ;; Don't add extra indentation to source blocks
        org-src-preserve-indentation t)

  :custom-face
  (org-level-1 ((t (:height 1.0 :weight bold))))
  (org-level-2 ((t (:height 1.0 :weight bold))))
  (org-level-3 ((t (:height 1.0 :weight bold))))
  (org-level-4 ((t (:height 1.0 :weight bold))))
  (org-level-5 ((t (:height 1.0 :weight bold))))
  (org-level-6 ((t (:height 1.0 :weight bold))))
  (org-level-7 ((t (:height 1.0 :weight bold))))
  (org-level-8 ((t (:height 1.0 :weight bold)))))

(provide 'init-org)
;;; init-org.el ends here
