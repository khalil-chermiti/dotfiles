;;; init-lsp.el --- Web Development LSP & Completion Setup -*- lexical-binding: t; -*-

;; 1. Environment Handling
;; Inherits PATH and NVM environment variables from Zsh for GUI Emacs on Fedora
(use-package exec-path-from-shell
  :ensure t
  :config
  (when (memq window-system '(x pgtk pg wayland))
    (exec-path-from-shell-copy-env "NVM_DIR")
    (exec-path-from-shell-initialize)))

;; 2. Autocompletion Engine (Corfu)
(use-package corfu
  :ensure t
  :custom
  (corfu-auto t)               ; Enable instant completion popups
  (corfu-cycle t)              ; Enable cycling through candidates
  (corfu-auto-delay 0.05)      ; Minimal delay (50ms) for snappy popups
  (corfu-auto-prefix 1)        ; Trigger completion after 1 character
  (corfu-preselect 'first)     ; Preselect top suggestion
  :init
  (global-corfu-mode))

;; Optional: File path completion support inside buffers
(use-package cape
  :ensure t
  :init
  (add-to-list 'completion-at-point-functions #'cape-file))

;; 3. Language Server Integration (Eglot)
(use-package eglot
  :ensure nil
  :hook
  ;; Hook Eglot into JS, TS, HTML, CSS, and JSON major modes
  (((js-mode js-ts-mode
    typescript-mode typescript-ts-mode tsx-ts-mode
    html-mode html-ts-mode
    css-mode css-ts-mode
    json-mode json-ts-mode) . eglot-ensure))
  
  :config
  ;; Explicitly assign the best language servers per mode
  (setq eglot-server-programs
        '(;; JS & TS -> vtsls (fast, reliable root handling)
          (((js-mode js-ts-mode)
            (typescript-mode typescript-ts-mode tsx-ts-mode))
           . ("vtsls" "--stdio"))
          
          ;; HTML -> VS Code extracted HTML server
          (((html-mode html-ts-mode))
           . ("vscode-html-language-server" "--stdio"))
          
          ;; CSS & Tailwind CSS
          (((css-mode css-ts-mode))
           . ("tailwindcss-language-server" "--stdio"))
          
          ;; JSON -> VS Code extracted JSON server
          (((json-mode json-ts-mode))
           . ("vscode-json-language-server" "--stdio"))))

  ;; Performance Tweaks

  (setq eglot-events-buffer-size 0)           ; Disable event logging for higher speed
  (setq eglot-autoshutdown t)                 ; Auto shutdown server when buffer is killed
  (setq eglot-ignored-server-capabilities '(:documentHighlightProvider)))

;; Auto-associate file extensions with Tree-sitter major modes
(add-to-list 'auto-mode-alist '("\\.ts\\'" . typescript-ts-mode))
(add-to-list 'auto-mode-alist '("\\.tsx\\'" . tsx-ts-mode))
(add-to-list 'auto-mode-alist '("\\.jsx\\'" . js-ts-mode))
(add-to-list 'auto-mode-alist '("\\.mjs\\'" . js-ts-mode))
(add-to-list 'auto-mode-alist '("\\.json\\'" . json-ts-mode))

;; Remap legacy modes to Tree-sitter equivalents globally
(setq major-mode-remap-alist
      '((typescript-mode . typescript-ts-mode)
        (js-mode . js-ts-mode)
        (json-mode . json-ts-mode)
        (css-mode . css-ts-mode)
        (html-mode . html-ts-mode)))

;; 4. UI Adjustments
;; Route Eldoc docs away from minibuffer echo area
(setq eldoc-display-functions '(eldoc-display-in-buffer))

;; Remove Flymake moving fringe arrow
(use-package flymake
  :ensure nil
  :custom
  (flymake-fringe-indicator-position nil))

(provide 'init-lsp)
