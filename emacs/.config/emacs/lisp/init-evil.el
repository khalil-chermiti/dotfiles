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

  ;; root Quick Access
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
  (my/leader-keys
    "t"   '(:ignore t :which-key "terminal")
    "t t" 'ansi-term
    "t e" 'eshell)

  ;; ------------------------------------------------------------------
  ;; Search (SPC s) - Powered by Consult
  ;; ------------------------------------------------------------------
  (my/leader-keys
    "s"   '(:ignore t :which-key "search")
    "s g" 'consult-ripgrep        ; Fast project-wide search via ripgrep (requires `rg` CLI)
    "s s" 'consult-line           ; Search lines in buffer with live jump previews
    "s f" 'consult-fd))           ; Consult find files (fd) 

;; ------------------------------------------------------------------
;; LSP / Code Actions (SPC l) - Powered by lsp-mode
;; ------------------------------------------------------------------
(my/leader-keys
  "l"   '(:ignore t :which-key "lsp")
  "l d" 'lsp-find-definition          ; Go to definition
  "l r" 'lsp-find-references          ; Find references
  "l i" 'lsp-find-implementation      ; Find implementation
  "l a" 'lsp-execute-code-action      ; Code actions / quick fixes
  "l R" 'lsp-rename                   ; Rename symbol
  "l h" 'lsp-ui-doc-glance            ; Open documentation / hover popup manually
  "l f" 'lsp-format-buffer           ; Format code manually via lsp-mode
  "l H" 'lsp-describe-thing-at-point)  ; Open docs in a separate buffer window

;; ------------------------------------------------------------------
;; Diagnostics (SPC d) - Powered by Flymake (lsp-mode default)
;; ------------------------------------------------------------------
(my/leader-keys
  "d"   '(:ignore t :which-key "diagnostics")
  "d n" 'flymake-goto-next-error      ; Jump to next error/warning
  "d p" 'flymake-goto-prev-error      ; Jump to previous error/warning
  "d f" 'display-local-help           ; Display error text at point in echo area
  "d l" 'flymake-show-buffer-diagnostics ; Open error list (like quickfix)
  "d t" 'flymake-mode)                ; Toggle diagnostics on/off

;; ------------------------------------------------------------------
;; Code Commenting (SPC c)
;; ------------------------------------------------------------------
(my/leader-keys
    "c"   '(:ignore t :which-key "comment")
    "c c" 'comment-line              ; Toggle comment on current line / region
    "c r" 'comment-or-uncomment-region) ; Toggle comment on active region

(provide 'init-evil)
;;; init-evil.el ends here
