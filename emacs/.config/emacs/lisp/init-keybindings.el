;;; init-evil.el --- Evil mode, .el, and Keybindings -*- lexical-binding: t; -*-

(use-package which-key
  :ensure nil
  :custom
  (which-key-idle-delay 0.3)
  (which-key-side-window-max-height 0.4)
  (which-key-side-window-location 'bottom)
  (which-key-sort-order 'which-key-local-then-key-order)
  :config
  (push '((nil . "-") . (nil . " ")) which-key-replacement-alist)
  (push '((nil . "^org-") . (nil . "")) which-key-replacement-alist)
  (which-key-mode 1))

(with-eval-after-load 'which-key
  (which-key-add-key-based-replacements
    "C-x v" "Version Control"
    "C-x w" "Window"
    "C-x t" "Tab"
    "C-x p" "Project"
    "C-x a" "Abbrevs"
    "C-x n" "Narrowing"
    "C-x r" "Reg & Rect"
    "C-x x" "Buffer"
    "C-x 8" "Unicodes"
    "C-x RET" "Coding Systems"
    "C-x 4" "Other Window"
    "C-x 5" "Frames"
    "C-x 6" "Two-Column"))

(use-package repeat
  :ensure nil
  :config
  (repeat-mode 1))

(use-package undo-tree
  :ensure t
  :init
  (global-undo-tree-mode)
  :config
  (setq undo-tree-history-directory-alist '(("." . "~/.emacs.d/undo"))))

(use-package evil
  :ensure t
  :init
  (setq evil-undo-system 'undo-tree)
  (setq evil-want-integration t)
  (setq evil-want-keybinding nil)
  (setq evil-want-C-i-jump t)
  (setq evil-want-C-u-scroll t)
  :config
  (evil-mode 1))

(use-package evil-collection
  :ensure t
  :after evil
  :config
  (evil-collection-init))

(use-package avy
  :ensure t)

(use-package general
  :ensure t
  :config
  (general-create-definer my/leader-keys
    :states '(normal visual motion emacs)
    :keymaps 'override
    :prefix "SPC"
    :global-prefix "C-SPC")

  (my/leader-keys
    "a"   '(avy-goto-char :which-key "avy char")
    "c"   '(my/toggle-corfu :which-key "toggle corfu")
    "u"   '(undo-tree-visualize :which-key "undo tree")
    "e"   '(find-file :which-key "find file")
    "o"   '(dired-jump :which-key "dired jump")
    "x"   '(execute-extended-command :which-key "M-x")
    "p"   '(:keymap project-prefix-map :which-key "project"))

  (my/leader-keys
    "w"   '(:ignore t :which-key "window")
    "w |" '(split-window-right :which-key "split right")
    "w -" '(split-window-below :which-key "split below")
    "w d" '(delete-window :which-key "delete")
    "w m" '(delete-other-windows :which-key "maximize")
    "w u" '(winner-undo :which-key "undo layout")
    "w o" '(other-window :which-key "other")
    "w =" '(balance-windows :which-key "balance")
    ;; Movement (lowercase)
    "w h" '(windmove-left :which-key "left")
    "w j" '(windmove-down :which-key "down")
    "w k" '(windmove-up :which-key "up")
    "w l" '(windmove-right :which-key "right")
    ;; Swapping (uppercase HJKL)
    "w H" '(windmove-swap-states-left :which-key "swap left")
    "w J" '(windmove-swap-states-down :which-key "swap down")
    "w K" '(windmove-swap-states-up :which-key "swap up")
    "w L" '(windmove-swap-states-right :which-key "swap right"))

  (my/leader-keys
    "b"   '(:ignore t :which-key "buffer")
    "b l" '(list-buffers :which-key "list")
    "b b" '(consult-buffer :which-key "switch")
    "b d" '(kill-current-buffer :which-key "kill")
    "b n" '(next-buffer :which-key "next")
    "b p" '(previous-buffer :which-key "prev")
    "b s" '(scratch-buffer :which-key "scratch")
    "b r" '(revert-buffer :which-key "revert"))

  (my/leader-keys
    "g"   '(:ignore t :which-key "git")
    "g s" '(magit-status :which-key "status")
    "g d" '(magit-dispatch :which-key "dispatch")
    "g f" '(magit-file-dispatch :which-key "file dispatch"))

  (my/leader-keys
    "t"   '(:ignore t :which-key "terminal")
    "t t" '(my/open-ansi-term-split :which-key "ansi term")
    "t e" '(my/open-eshell-split :which-key "eshell"))

  (my/leader-keys
    "m"   '(:ignore t :which-key "org")
    "m c" '(org-capture :which-key "capture")
    "m e" '(org-export-dispatch :which-key "export")
    "m t" '(:ignore t :which-key "toggle")
    "m t i" '(org-indent-mode :which-key "indent")
    "m t l" '(org-toggle-link-display :which-key "links")
    "m a" '(org-agenda :which-key "agenda"))

  (my/leader-keys
    "f"   '(:ignore t :which-key "find")
    "f f" '(consult-fd :which-key "file")
    "f w" '(consult-ripgrep :which-key "grep")
    "f r" '(consult-recent-file :which-key "recent")
    "f l" '(consult-line :which-key "line"))

  (my/leader-keys
    "l"   '(:ignore t :which-key "lsp")
    "l d" '(lsp-find-definition :which-key "definition")
    "l r" '(lsp-find-references :which-key "references")
    "l i" '(lsp-find-implementation :which-key "implementation")
    "l a" '(lsp-execute-code-action :which-key "action")
    "l R" '(lsp-rename :which-key "rename")
    "l h" '(lsp-ui-doc-glance :which-key "glance doc")
    "l f" '(lsp-format-buffer :which-key "format")
    "l H" '(lsp-describe-thing-at-point :which-key "help at point")
    "l c" '(comment-line :which-key "line")
    "l C" '(comment-or-uncomment-region :which-key "region")
    )

  (my/leader-keys
    "d"   '(:ignore t :which-key "diagnostics")
    "d n" '(flymake-goto-next-error :which-key "next error")
    "d p" '(flymake-goto-prev-error :which-key "prev error")
    "d m" '(display-local-help :which-key "local help")
    "d d" '(flymake-show-buffer-diagnostics :which-key "buffer list")
    "d t" '(flymake-mode :which-key "toggle mode"))
)

(provide 'init-keybindings)
;;; init-evil.el ends here
