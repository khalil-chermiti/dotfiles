;;; init-ui.el --- Frame, Theme, and Modeline Settings -*- lexical-binding: t; -*-

(use-package emacs
  :custom
  (echo-keystrokes 0.01)
  (truncate-lines t)
  (line-number-mode t)
  (column-number-mode t)
  (fringe-mode '(8 . 8))
  (confirm-kill-emacs 'y-or-n-p)
  (window-divider-default-right-width 1)
  (window-divider-default-places 'right-only)
  (default-input-method "azerty-to-arabic")
  (line-spacing 0.2)
  (use-short-answers t)
	(tab-width 2)
  (indent-tabs-mode nil)
  (fringe-indicator-alist (assoc-delete-all 'truncation
                                           (assoc-delete-all 'continuation fringe-indicator-alist)))

  :config
  (size-indication-mode 1)
  (recentf-mode 1)
  (savehist-mode 1)
  (winner-mode 1)
  (window-divider-mode 1)

  (set-face-attribute 'default nil :font "JetBrainsMono NF" :height 110)
  
  (set-face-attribute 'help-key-binding nil
                      :inherit 'default
                      :background 'unspecified
                      :foreground "#fca103"
                      :box nil)
  
  (set-fontset-font t 'arabic "Noto Kufi Arabic")

  (add-hook 'text-mode-hook #'visual-line-mode)
  (add-hook 'text-mode-hook #'flyspell-mode))

(use-package display-line-numbers
  :ensure nil
  ;; :config
  ;; (global-display-line-numbers-mode 1)
  :hook ((prog-mode . display-line-numbers-mode)
         (org-mode . display-line-numbers-mode)
         (fundamental-mode . display-line-numbers-mode)))

(use-package hl-line
  :ensure nil
  :config
  (global-hl-line-mode 1))

(use-package nerd-icons
  :ensure t)

(use-package kanagawa-themes
  :ensure t)

(use-package auto-dark
  :ensure t
  :custom
  (auto-dark-themes '((kanagawa-wave) (kanagawa-lotus)))
  :config
  (auto-dark-mode 1)
  (set-face-attribute 'window-divider nil 
		      :foreground "gray" 
		      :background "gray")

  ;; reset divider bg after theme changes
  (add-hook 'enable-theme-functions
	    (lambda (&rest _) ;; _ is new theme
	      (set-face-attribute 'window-divider nil 
				  :foreground "gray" 
				  :background "gray"))))

(use-package doom-modeline
  :ensure t
  :custom
  (doom-modeline-height 28)
  (doom-modeline-mouse nil)
  (doom-modeline-bar-width 8)
  (doom-modeline-icon t)
  (doom-modeline-major-mode-icon nil)
  (doom-modeline-major-mode-color-icon nil)
  (doom-modeline-buffer-file-name-style 'file-name)
  (doom-modeline-minor-modes nil)
  (doom-modeline-buffer-encoding nil)
  (doom-modeline-icon t)
  (doom-modeline-major-mode-icon t)
  (doom-modeline-check nil)
  (doom-modeline-lsp t)

  :config
  (custom-set-faces
   '(mode-line ((t (:box (:line-width 1 :color "gray")))))
   '(mode-line-inactive ((t (:box (:line-width 1 :color "gray")))))
   '(doom-modeline-bar ((t (:background "#d27e99")))))
  
  :init
  (doom-modeline-mode 1))

(use-package markdown-mode
  :ensure t
  :config
  (custom-set-faces '(markdown-list-face ((t (:background nil)))))
  (add-hook 'markdown-mode-hook #'markdown-toggle-markup-hiding))

(use-package inhibit-mouse
  :ensure t
  :custom
  (inhibit-mouse-adjust-mouse-highlight t)
  (inhibit-mouse-adjust-show-help-function t)
  :init
  (if (daemonp)
      (add-hook 'server-after-make-frame-hook #'inhibit-mouse-mode)
    (inhibit-mouse-mode 1)))

(provide 'init-ui)
;;; init-ui.el ends here
