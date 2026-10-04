;;; init-evil.el --- Evil mode, .el, and Keybindings -*- lexical-binding: t; -*-

(use-package which-key
  :ensure nil
  :custom
  (which-key-idle-delay 0.3)
  (which-key-side-window-max-height 0.4)
  (which-key-side-window-location 'bottom)
  (which-key-sort-order 'which-key-local-then-key-order)
  :config
  (push '((nil . "digit-argument") . "") which-key-replacement-alist)
  (push '((nil . "-") . (nil . " ")) which-key-replacement-alist)
  (push '((nil . "^org-") . (nil . "")) which-key-replacement-alist)
  (push '((nil . "^project\\W") . (nil . "")) which-key-replacement-alist)
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
  (setq evil-want-minibuffer nil)
  (setq evil-want-C-i-jump t)
  (setq evil-want-C-u-scroll t)
  :config
  (evil-mode 1))

(use-package evil-nerd-commenter
  :ensure t
  :after evil)

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

  (general-def
    :keymaps 'override
    "C-," 'consult-line
    "C-;" 'embark-act
    "C-:" 'avy-goto-char-timer)

  (general-create-definer my/leader-keys
    :states '(normal visual motion emacs)
    :keymaps 'override
    :prefix "SPC"
    :global-prefix "C-SPC")

  (my/leader-keys
    "SPC" '(find-file :which-key "Find file")
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
    "w a" '(ace-window :which-key "Select")
    "w t" '(transpose-frame :which-key "Transpose")
    "w f" '(flop-frame :which-key "Mirror ⇆")
    "w F" '(flip-frame :which-key "Mirror ⇅")
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
    "g f" '(magit-file-dispatch :which-key "File dispatch")
    "g h" '(diff-hl-show-hunk :which-key "Show hunk"))

(global-set-key (kbd "C-c a") 'my/toggle-arabic)
(global-set-key (kbd "C-c b") 'my/eww-open)

  (my/leader-keys
    "t"   '(:ignore t :which-key "Toggle/Open")
    "t c" '(my/toggle-corfu :which-key "Corfu")
    "t s" '(my/toggle-flyspell :which-key "Flyspell")
    "t t" '(my/open-ansi-term-split :which-key "Ansi term")
    "t a" '(my/toggle-arabic :which-key "Arabic")
    "t b" '(my/eww-open :which-key "Eww")
    "t e" '(my/open-eshell-split :which-key "Eshell"))

  (my/leader-keys
    "a"   '(:ignore t :which-key "Apps")
    "a g" '(gptel :which-key "Gemini")
    "a f" '(elfeed :which-key "Elfeed")
    "a t" '(my/translate :which-key "Translator")
    "a d" '(my/dictionary :which-key "Dictionary"))

  (my/leader-keys
    "o"   '(:ignore t :which-key "Org")
    "o a" '(org-agenda :which-key "Agenda")
    "o c" '(org-capture :which-key "Capture")
    "o r" '(:ignore t :which-key "Roam")
    "o r f" '(org-roam-node-find :which-key "Find node")
    "o r i" '(org-roam-node-insert :which-key "Insert node")
    "o r c" '(org-roam-capture :which-key "Capture"))

  (my/leader-keys
    "f"   '(:ignore t :which-key "Find")
    "f f" '(consult-fd :which-key "Consult file")
    "f g" '(consult-ripgrep :which-key "Grep")
    "f r" '(consult-recent-file :which-key "Recent"))

  (my/leader-keys
    "l"   '(:ignore t :which-key "Lsp")
    "l d" '(lsp-find-definition :which-key "Definition")
    "l r" '(lsp-find-references :which-key "References")
    "l i" '(lsp-find-implementation :which-key "Implementation")
    "l a" '(lsp-execute-code-action :which-key "Action")
    "l R" '(lsp-rename :which-key "Rename")
    "l h" '(lsp-ui-doc-glance :which-key "Glance doc")
    "l f" '(lsp-format-buffer :which-key "Format")
    "l H" '(lsp-describe-thing-at-point :which-key "Help at point"))

  (my/leader-keys
    "e"   '(:ignore t :which-key "Errors")
    "e n" '(flymake-goto-next-error :which-key "Next error")
    "e p" '(flymake-goto-prev-error :which-key "Prev error")
    "e d" '(flymake-show-buffer-diagnostics :which-key "Buffer list")
    "e t" '(flymake-mode :which-key "Toggle mode")
    "e l" '(display-local-help :which-key "Local help"))

  (my/leader-keys
    "c"   '(:ignore t :which-key "Comment")
    "c c" '(evilnc-comment-or-uncomment-lines :which-key "Comment line")
    "c l" '(evilnc-quick-comment-or-uncomment-to-the-line :which-key "Comment to line")
    "c y" '(evilnc-copy-and-comment-lines :which-key "Copy and comment")
    "c p" '(evilnc-comment-or-uncomment-paragraphs :which-key "Comment paragraph")))

(provide 'init-keybindings)
;;; init-evil.el ends here
