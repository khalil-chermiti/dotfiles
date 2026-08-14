;;; init-files.el --- Backups, Auto-saves, and Dired -*- lexical-binding: t; -*-

;; Redirect backup and auto-save files to a central cache folder
(use-package files
  :ensure nil
  :custom
  (backup-directory-alist `(("." . ,(expand-file-name "backups/" user-emacs-directory))))
  (auto-save-file-name-transforms `((".*" ,(expand-file-name "auto-save/" user-emacs-directory) t)))
  (create-lockfiles nil))

;; Dired (File Manager)
(use-package dired
  :ensure nil
  :commands (dired dired-jump)
  :custom
  (delete-by-moving-to-trash t)
  (dired-listing-switches "-AGhlv --group-directories-first")
  (dired-dwim-target t)
  (dired-recursive-copies 'always)
  (dired-recursive-deletes 'always)
  (dired-isearch-filenames 'dwim)
  (global-auto-revert-non-file-buffers t)
  (dired-hide-details-hide-symlink-targets t)
  :config
  (add-hook 'dired-mode-hook #'dired-hide-details-mode)
  (setq dired-kill-when-opening-new-dired-buffer t))

(use-package dired-hide-dotfiles
  :hook (dired-mode . dired-hide-dotfiles-mode)
  :config
  (evil-define-key 'normal dired-mode-map
    "H" #'dired-hide-dotfiles-mode))

(use-package nerd-icons-dired
  :ensure t
  :hook
  (dired-mode . nerd-icons-dired-mode))

(provide 'init-files)
;;; init-files.el ends here
