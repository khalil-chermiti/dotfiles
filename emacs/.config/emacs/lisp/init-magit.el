;;; init-magit.el --- Magit Configuration -*- lexical-binding: t; -*-

(use-package magit
  :ensure t)

(use-package git-gutter
  :hook (prog-mode . git-gutter-mode)
  :config
  (setq git-gutter:update-interval 0.02))

(use-package git-gutter-fringe
  :config
  (define-fringe-bitmap 'git-gutter-fr:added [224] nil nil '(center repeated))
  (define-fringe-bitmap 'git-gutter-fr:modified [224] nil nil '(center repeated))
  (define-fringe-bitmap 'git-gutter-fr:deleted [128 192 224 240] nil nil 'bottom))

;; Explicitly set the colors for the fringe bars here:
(custom-set-faces
 '(git-gutter-fr:added    ((t (:foreground "#98be65" :box nil))))  ; Soft green
 '(git-gutter-fr:modified ((t (:foreground "#51afef" :box nil))))  ; Soft blue
 '(git-gutter-fr:deleted  ((t (:foreground "#ff6c6b" :box nil)))))  ; Soft red

(use-package blamer
  :bind (("C-c g" . blamer-mode))
  :config
  (setq blamer-idle-time 0.05)
  (setq blamer-author-formatter "%s ")
  (setq blamer-datetime-formatter "[%s]")
  (setq blamer-commit-formatter ": %s")
  (setq blamer-max-commit-message-length 100)
  (setq blamer-min-offset 70))

(provide 'init-magit)
;;; init-magit.el ends here
