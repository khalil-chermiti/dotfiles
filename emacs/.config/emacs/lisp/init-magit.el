;;; init-magit.el --- Magit and Diff-HL Configuration -*- lexical-binding: t; -*-

(use-package magit
  :ensure t
  :custom
  ;; Magit status in full buffer buffer
  (magit-display-buffer-function #'magit-display-buffer-fullframe-status-v1))

(use-package diff-hl
  :ensure t
  :init
  (global-diff-hl-mode 1)
  (add-hook 'prog-mode-hook #'diff-hl-flydiff-mode)
  (add-hook 'dired-mode-hook #'diff-hl-dired-mode)
  (add-hook 'magit-pre-refresh-hook #'diff-hl-magit-pre-refresh)
  (add-hook 'magit-post-refresh-hook #'diff-hl-magit-post-refresh))

(use-package blamer
  :config
  (setq blamer-idle-time 0.05)
  (setq blamer-author-formatter "%s ")
  (setq blamer-datetime-formatter "[%s]")
  (setq blamer-commit-formatter ": %s")
  (setq blamer-max-commit-message-length 100)
  (setq blamer-min-offset 70))

(provide 'init-magit)
;;; init-magit.el ends here
