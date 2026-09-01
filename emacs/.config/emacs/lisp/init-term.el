;;; init-term.el --- Term Configuration -*- lexical-binding: t; -*-

;; Set zsh as default for ansi-term
(setq ansi-term-shell "/usr/bin/zsh")

;; Open eshell in a split window
(defun my/open-eshell-split ()
  (interactive)
  (split-window-below)
  (other-window 1)
  (eshell))

;; Open ansi-term in a split window
(defun my/open-ansi-term-split ()
  (interactive)
  (split-window-below)
  (other-window 1)
  (ansi-term ansi-term-shell))

(provide 'init-term)
;;; init-term.el ends here
