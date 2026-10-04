;;; init-term.el --- Term Configuration -*- lexical-binding: t; -*-

;; Set zsh as default for ansi-term
(setq ansi-term-shell "/usr/bin/zsh")

(use-package eshell
  :ensure nil
	:hook (eshell-mode . (lambda ()
												 (setq-local completion-at-point-functions
																		 (list #'pcomplete-completions-at-point))))
  :config
	(defun my/eshell-prompt ()
		(let* ((last-status eshell-last-command-status)
					 (status-str (if (zerop last-status)
													 ""
												 (propertize (format " ✖ %d" last-status) 'face '(:foreground "red"))))
					 (path (file-name-nondirectory (eshell/pwd))))
			(concat " " path status-str " ")))

	(setq eshell-prompt-function 'my/eshell-prompt
				eshell-prompt-regexp "^ .*? ")

  (setq eshell-scroll-to-bottom-on-input t
        eshell-hist-ignoredups t
				eshell-banner-message ""
        eshell-save-history-on-exit t
        eshell-visual-commands '("htop" "top" "less" "ssh")
        eshell-prompt-regexp "^\\[.*?\\] [$#] "))

(use-package eshell-syntax-highlighting
  :after eshell
  :ensure t
  :config
  (eshell-syntax-highlighting-global-mode 1))

;; Open eshell in a split window
(defun my/open-eshell-split ()
  (interactive)
  (split-window-below)
  (other-window 1)
  (eshell)
  (evil-emacs-state))

;; Open ansi-term in a split window
(defun my/open-ansi-term-split ()
  (interactive)
  (split-window-below)
  (other-window 1)
  (ansi-term ansi-term-shell)
  (evil-emacs-state))

(provide 'init-term)
;;; init-term.el ends here
