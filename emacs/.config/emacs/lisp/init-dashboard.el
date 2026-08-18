(use-package dashboard
  :ensure t
  :init
  ;; Visual alignment and icons
  (setq dashboard-center-content t)
  (setq dashboard-show-shortcuts t)
  (setq dashboard-display-icons-p t)
  (setq dashboard-icon-type 'nerd-icons) ; Requires `nerd-icons` package

  ;; Customize header and banner
  (setq dashboard-banner-logo-title nil)
  (setq dashboard-startup-banner 'logo) ; Options: 'official, 'logo, or path to an image/txt file
  
  ;; Items to display and their limits
  (setq dashboard-items '((recents  . 5)
                          (bookmarks . 5)
                          (projects . 5)
                          (agenda . 5)))

  ;; Custom item icons/labels
  (setq dashboard-set-heading-icons t)
  (setq dashboard-set-file-icons t)
  (setq dashboard-set-navigator-p t)

  :config
  (dashboard-setup-startup-hook))

(provide 'init-dashboard)
