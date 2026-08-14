;;; init-org.el --- Org Mode Configuration -*- lexical-binding: t; -*-

(use-package org
  :ensure nil
  :hook ((org-mode . org-indent-mode)
         (org-mode . visual-line-mode))

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
