;;; init-ui.el --- Frame, Theme, and Modeline Settings -*- lexical-binding: t; -*-

(use-package emacs
  :custom
  (desktop-save-mode t)
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

  :config
  (size-indication-mode 1)
  (recentf-mode 1)
  (savehist-mode 1)
  (winner-mode 1)
  (window-divider-mode 1)

  (set-face-attribute 'default nil :font "JetBrainsMono NF" :height 110)
  
  (set-fontset-font t 'arabic "Noto Kufi Arabic")

	(add-hook 'text-mode-hook #'visual-line-mode)

  (setq display-buffer-alist
        '(("\\`\\*Org Agenda\\*\\'"
           (display-buffer-full-frame))

          ("\\`gem.*"
           (display-buffer-at-bottom)
           (window-height. 0.4))

          ("\\*undo-tree\\*"
           (display-buffer-in-side-window)
           (side . right)
           (window-width . 0.3))
          )));

(use-package display-line-numbers
  :ensure nil
  :hook ((prog-mode . display-line-numbers-mode)))

(use-package hl-line
	:ensure nil
	:config
	(add-hook 'prog-mode-hook #'hl-line-mode)
	(add-hook 'text-mode-hook #'hl-line-mode))

(use-package nerd-icons
  :ensure t)

(use-package nerd-icons-completion
	:ensure t
	:after marginalia
	:config
	(add-hook 'marginalia-mode-hook #'nerd-icons-completion-marginalia-setup))

(use-package nerd-icons-corfu
  :ensure t
  :after corfu
  :config
  (add-to-list 'corfu-margin-formatters #'nerd-icons-corfu-formatter))

(use-package auto-dark
  :ensure t
  :custom
  (auto-dark-themes '((ef-autumn) (ef-eagle)))
  :config
  (auto-dark-mode 1))

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
  
  :init
  (doom-modeline-mode 1))

(use-package inhibit-mouse
  :ensure t
  :custom
  (inhibit-mouse-adjust-mouse-highlight t)
  (inhibit-mouse-adjust-show-help-function t))

;; more on https://www.rahuljuliato.com/posts/emacs-tab-bar-groups#
(use-package tab-bar
  :ensure nil
  :defer t
  :custom
  (tab-bar-show 1)
  (tab-bar-close-button-show t)
  (tab-bar-new-button-show t)
  (tab-bar-tab-hints nil)
  (tab-bar-auto-width t)
  (tab-bar-separator " ")
  (tab-bar-format '(tab-bar-format-tabs
                    tab-bar-separator
                    tab-bar-format-add-tab)))

(use-package transpose-frame
  :ensure t)

(provide 'init-ui)
;;; init-ui.el ends here
