(use-package minimal-dashboard
  :ensure t
  :init
  (setq initial-buffer-choice #'minimal-dashboard)

  :custom
  (minimal-dashboard-buffer-name "Dashboard")
  (minimal-dashboard-text "Free as in freedom.")

  (minimal-dashboard-image-scale 1)
  (minimal-dashboard-enable-resize-handling t)
  (minimal-dashboard-modeline-shown t))

(provide 'init-dashboard)
