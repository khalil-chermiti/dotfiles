;;; init-evil.el --- Evil mode, .el, and Keybindings -*- lexical-binding: t; -*-

(use-package which-key
  :ensure nil
  :custom
  (which-key-idle-delay 0.3)
  (which-key-side-window-max-height 0.4)
  (which-key-side-window-location 'bottom)
  (which-key-deny-regex '("digit-argument"))
  :config
  ;; Keep push and mode functions in :config
  (push '((nil . "Prefix Command") . (nil . "prefix")) which-key-replacement-alist)
  (which-key-mode 1))

(use-package repeat
  :ensure nil
  :config
  (repeat-mode 1))

(use-package evil
  :ensure t
  :init
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

(use-package undo-tree
  :ensure t
  :init
  (global-undo-tree-mode)
  :config
  (setq undo-tree-history-directory-alist '(("." . "~/.emacs.d/undo"))))

(use-package general
  :ensure t
  :config
  (general-create-definer my/leader-keys
    :states '(normal visual motion emacs)
    :keymaps 'override
    :prefix "SPC"
    :global-prefix "C-SPC")

  (my/leader-keys
    "u"   'undo-tree-visualize
    "e"   'find-file
    "o"   'dired-jump
    "x"   'execute-extended-command
    "p" '(:keymap project-prefix-map :which-key "project"))

  (my/leader-keys
    "w"   '(:ignore t :which-key "windows")
    "w |" 'split-window-right
    "w -" 'split-window-below
    "w d" 'delete-window
    "w m" 'delete-other-windows
    "w u" 'winner-undo
    "w o" 'other-window
    "w =" 'balance-windows
    ;; Movement (lowercase)
    "w h" 'windmove-left
    "w j" 'windmove-down
    "w k" 'windmove-up
    "w l" 'windmove-right
    ;; Swapping (uppercase HJKL)
    "w H" 'windmove-swap-states-left
    "w J" 'windmove-swap-states-down
    "w K" 'windmove-swap-states-up
    "w L" 'windmove-swap-states-right)

  (my/leader-keys
    "b"   '(:ignore t :which-key "buffers")
    "b b" 'consult-buffer
    "b d" 'kill-current-buffer
    "b n" 'next-buffer
    "b p" 'previous-buffer
    "b s" 'scratch-buffer
    "b r" 'revert-buffer)

  (my/leader-keys
    "t"   '(:ignore t :which-key "terminal")
    "t t" 'ansi-term
    "t e" 'eshell)

  (my/leader-keys
    "m"   '(:ignore t :which-key "org mode")


    ;; Org Capture
    "m c" 'org-capture 
    
    ;; Exporting
    "m e" '(org-export-dispatch :which-key "export")

    ;; Toggles
    "m t" '(:ignore t :which-key "toggle")
    "m t i" '(org-indent-mode :which-key "toggle indentation mode")
    "m t l" '(org-toggle-link-display :which-key "toggle link view")

    "m a" '(org-agenda :which-key "agenda")
    "m c" '(org-capture :which-key "capture"))

  (my/leader-keys
    "f"   '(:ignore t :which-key "find")
    "f f" 'consult-fd 
    "f w" 'consult-ripgrep
    "f r" 'consult-recent-file
    "f l" 'consult-line)

  (my/leader-keys
    "l"   '(:ignore t :which-key "lsp")
    "l d" 'lsp-find-definition          
    "l r" 'lsp-find-references          
    "l i" 'lsp-find-implementation      
    "l a" 'lsp-execute-code-action      
    "l R" 'lsp-rename                   
    "l h" 'lsp-ui-doc-glance            
    "l f" 'lsp-format-buffer           
    "l H" 'lsp-describe-thing-at-point)  

  (my/leader-keys
    "d"   '(:ignore t :which-key "diagnostics")
    "d n" 'flymake-goto-next-error      
    "d p" 'flymake-goto-prev-error      
    "d m" 'display-local-help           
    "d d" 'flymake-show-buffer-diagnostics 
    "d t" 'flymake-mode)                

  (my/leader-keys
    "c"   '(:ignore t :which-key "comment")
    "c c" 'comment-line              
    "c r" 'comment-or-uncomment-region))

(provide 'init-evil)
;;; init-evil.el ends here
