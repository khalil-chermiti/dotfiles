;;; init-evil.el --- Evil mode, .el, and Keybindings -*- lexical-binding: t; -*-

(use-package which-key
  :ensure nil ; Built-in in Emacs 30
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

;; Evil Mode Setup
(use-package evil
  :ensure t
  :init
  (setq evil-want-integration t)
  (setq evil-want-keybinding nil) ; Prepares Evil for evil-collection
  (setq evil-want-C-i-jump t)      ; C-i jumps forward in jump list
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
  ;; Keep undo history files organized in one folder
  (setq undo-tree-history-directory-alist '(("." . "~/.emacs.d/undo"))))

(use-package general
  :ensure t
  :config
  (general-create-definer my/leader-keys
    :states '(normal visual motion emacs)
    :keymaps 'override
    :prefix "SPC"
    :global-prefix "C-SPC")

  ;; Root Quick Access
  (my/leader-keys
    "u"   'undo-tree-visualize
    "o"   'dired-jump
    "f"   'find-file
    "x"   'execute-extended-command
    "p" '(:keymap project-prefix-map :which-key "project"))

  ;; ------------------------------------------------------------------
  ;; Window Management (SPC w)
  ;; ------------------------------------------------------------------
  (my/leader-keys
    "w"   '(:ignore t :which-key "windows")
    "w |" 'split-window-right
    "w -" 'split-window-below
    "w d" 'delete-window
    "w m" 'delete-other-windows
    "w o" 'other-window
    "w =" 'balance-windows
    "w h" 'windmove-left
    "w j" 'windmove-down
    "w k" 'windmove-up
    "w l" 'windmove-right)

  ;; ------------------------------------------------------------------
  ;; Buffer Management (SPC b) - Upgraded with Consult
  ;; ------------------------------------------------------------------
  (my/leader-keys
    "b"   '(:ignore t :which-key "buffers")
    "b b" 'consult-buffer         ; Unified switcher: buffers, recent files & bookmarks
    "b d" 'kill-current-buffer
    "b n" 'next-buffer
    "b p" 'previous-buffer
    "b s" 'scratch-buffer
    "b r" 'revert-buffer)

  ;; ------------------------------------------------------------------
  ;; Terminal / Shell Management (SPC t) 
  ;; ------------------------------------------------------------------
  ;; (my/leader-keys
  ;;   "t"   '(:ignore t :which-key "terminal")
  ;;   "t t" 'ansi-term;
  ;;   "t e" 'eshell)

  ;; ------------------------------------------------------------------
  ;; Search (SPC s) - Powered by Consult
  ;; ------------------------------------------------------------------
  (my/leader-keys
    "s"   '(:ignore t :which-key "search")
    "s g" 'consult-ripgrep        ; Fast project-wide search via ripgrep (requires `rg` CLI)
    "s s" 'consult-line           ; Search lines in buffer with live jump previews
    "s f" 'consult-fd))           ; Consult find files (fd) 


  ;; ------------------------------------------------------------------
  ;; LSP / Code Actions (SPC l) - Powered by Eglot
  ;; ------------------------------------------------------------------
  (my/leader-keys
    "l"   '(:ignore t :which-key "lsp")
    "l d" 'xref-find-definitions        ; Go to definition
    "l r" 'xref-find-references         ; Find references
    "l i" 'eglot-find-implementation    ; Find implementation
    "l a" 'eglot-code-actions          ; Code actions / quick fixes
    "l R" 'eglot-rename                ; Rename symbol
    "l h" 'eldoc-doc-buffer             ; Open documentation / hover buffer
    "l H" 'eglot-inlay-hints-mode)      ; Toggle inlay hints (Emacs 30 native)

  (my/leader-keys
    "d"   '(:ignore t :which-key "diagnostics")
    "d n" 'flymake-goto-next-error      ; Jump to next error/warning
    "d p" 'flymake-goto-prev-error      ; Jump to previous error/warning
    "d f" 'display-local-help           ; Display error float at point
    "d q" 'flymake-show-buffer-diagnostics ; Open error list (like quickfix)
    "d t" 'flymake-mode)                ; Toggle diagnostics on/off

  (general-def :states 'insert
    "C-s" 'eldoc)                         ; Trigger signature help in insert mode

(provide 'init-evil)

;; INIT-EVIL.EL ENDS HERE
