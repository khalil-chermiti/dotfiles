;;; init-ui.el --- Frame, Theme, and Modeline Settings -*- lexical-binding: t; -*-

;; 1. Core Emacs UI & Typography
(use-package emacs
  :custom
  (echo-keystrokes 0.01)
  (truncate-lines t)
  
  ;; Silence truncation/continuation arrows in fringe
  (fringe-indicator-alist (assoc-delete-all 'truncation
                                            (assoc-delete-all 'continuation fringe-indicator-alist)))
  
  :config
  (setq line-number-mode t)
  (setq column-number-mode t)
  (size-indication-mode 1)
  (recentf-mode 1)
  (savehist-mode 1)

  ;; Font Configuration (Height in 1/10th pt -> 130 = 13pt)
  (set-face-attribute 'default nil :font "JetBrainsMono NF" :height 130)
  (setq-default line-spacing 0.2)


  ;; Keybinding Help Highlight Color
  (set-face-attribute 'help-key-binding nil
                      :inherit 'default
                      :background 'unspecified
                      :foreground "#fca103"
                      :box nil)

  ;; Do not automatically turn on visual line mode in text modes
  (remove-hook 'text-mode-hook 'turn-on-visual-line-mode))

;; 2. Line Numbers & Cursor Line
(use-package display-line-numbers
  :ensure nil
  :config
  (global-display-line-numbers-mode 1))

(use-package hl-line
  :ensure nil
  :config
  (global-hl-line-mode 1))

;; 3. Themes & Auto-Dark Sync
(use-package kanagawa-themes
  :ensure t)

(use-package auto-dark
  :ensure t
  :custom
  (auto-dark-themes '((kanagawa-wave) (kanagawa-lotus)))
  :config
  (auto-dark-mode 1))

(use-package doom-modeline
  :ensure t
  :custom
  (doom-modeline-height 25)
  (doom-modeline-mouse nil)
  (doom-modeline-bar-width 0)
  (doom-modeline-icon t)
  (doom-modeline-major-mode-icon nil)
  (doom-modeline-major-mode-color-icon nil)
  ;;(doom-modeline-buffer-file-name-style 'relative-from-project)
  (doom-modeline-buffer-file-name-style 'file-name)
  (doom-modeline-minor-modes nil)
  (doom-modeline-buffer-encoding nil)      ; <-- Hides "LF UTF-8" completely
  :init
  (doom-modeline-mode 1))

;; 5. Mouse Invalidation
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
