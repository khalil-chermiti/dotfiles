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
  (evil-collection-init)
  (evil-collection-define-key 'normal 'dired-mode-map "g" 'revert-buffer))

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
    "a"   '(embark-act :which-key "Embark act")
    "u"   '(undo-tree-visualize :which-key "Undo tree")
    "x"   '(execute-extended-command :which-key "M-x")
    "p"   '(:keymap project-prefix-map :which-key "Project"))

  (my/leader-keys
    "w"   '(:ignore t :which-key "Window")
    "w |" '(split-window-right :which-key "Split right")
    "w -" '(split-window-below :which-key "Split below")
    "w d" '(delete-window :which-key "Delete")
    "w m" '(delete-other-windows :which-key "Maximize")
    "w u" '(winner-undo :which-key "Undo layout")
    "w o" '(other-window :which-key "Other")
    "w =" '(balance-windows :which-key "Balance")
    ;; Movements
    "w h" '(windmove-left :which-key "Left")
    "w j" '(windmove-down :which-key "Down")
    "w k" '(windmove-up :which-key "Up")
    "w l" '(windmove-right :which-key "Right"))

  (my/leader-keys
    "b"   '(:ignore t :which-key "Buffer")
    "b l" '(list-buffers :which-key "List")
    "b b" '(consult-buffer :which-key "Switch")
    "b d" '(kill-current-buffer :which-key "Kill")
    "b n" '(next-buffer :which-key "Next")
    "b p" '(previous-buffer :which-key "Prev")
    "b s" '(scratch-buffer :which-key "Scratch")
    "b r" '(revert-buffer :which-key "Revert"))

  (my/leader-keys
    "g"   '(:ignore t :which-key "Git")
    "g s" '(magit-status :which-key "Status")
    "g d" '(magit-dispatch :which-key "Dispatch")
    "g f" '(magit-file-dispatch :which-key "File dispatch"))

  (my/leader-keys
    "t"   '(:ignore t :which-key "Toggle")
    "t a" '(gptel :which-key "Gemini")
    "t i" '(toggle-input-method :which-key "Input method")
    "t r" '(my/toggle-bidi :which-key "RTL")
    "t I" '(org-indent-mode :which-key "Org indent")
    "t o" '(dired-jump :which-key "Dired jump")
    "t c" '(my/toggle-corfu :which-key "Corfu")
    "t t" '(my/open-ansi-term-split :which-key "Ansi term")
    "t E" '(my/open-eshell-split :which-key "Eshell"))

  (my/leader-keys
    "o"   '(:ignore t :which-key "Org")
    "o c" '(org-capture :which-key "Capture")
    "o e" '(org-export-dispatch :which-key "Export")
    "o a" '(org-agenda :which-key "Agenda"))

  (my/leader-keys
    "f"   '(:ignore t :which-key "Find")
    "f a" '(avy-goto-char :which-key "Avy char")
    "f f" '(consult-fd :which-key "Consult file")
    "f w" '(consult-ripgrep :which-key "Grep")
    "f r" '(consult-recent-file :which-key "Recent")
    "f l" '(consult-line :which-key "Line"))

  (my/leader-keys
    "l"   '(:ignore t :which-key "Lsp")
    "l d" '(lsp-find-definition :which-key "Definition")
    "l r" '(lsp-find-references :which-key "References")
    "l i" '(lsp-find-implementation :which-key "Implementation")
    "l a" '(lsp-execute-code-action :which-key "Action")
    "l R" '(lsp-rename :which-key "Rename")
    "l h" '(lsp-ui-doc-glance :which-key "Glance doc")
    "l f" '(lsp-format-buffer :which-key "Format")
    "l H" '(lsp-describe-thing-at-point :which-key "Help at point")
    "l c" '(comment-line :which-key "Line")
    "l C" '(comment-or-uncomment-region :which-key "Region")
    )

  (my/leader-keys
    "d"   '(:ignore t :which-key "Diagnostics")
    "d n" '(flymake-goto-next-error :which-key "Next error")
    "d p" '(flymake-goto-prev-error :which-key "Prev error")
    "d m" '(display-local-help :which-key "Local help")
    "d d" '(flymake-show-buffer-diagnostics :which-key "Buffer list")
    "d t" '(flymake-mode :which-key "Toggle mode"))
)

(provide 'init-keybindings)
;;; init-evil.el ends here
