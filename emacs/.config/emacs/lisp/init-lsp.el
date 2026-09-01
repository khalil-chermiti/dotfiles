;;; init-lsp.el --- LSP-mode and Corfu setup for Emacs IDE -*- lexical-binding: t; -*-

;; Manually adding executable to exec-path and path (else use exec-path-from-shell)
(dolist (path '("~/.local/bin"
                "~/.nvm/versions/node/v24.14.1/bin"))
  (let ((path (expand-file-name path)))
    (add-to-list 'exec-path path)
    (setenv "PATH"
            (concat path ":" (getenv "PATH")))))

(setq auto-mode-alist
      (append '(("\\.java\\'" . java-mode)
                ("\\.js\\'"    . js-mode)
                ("\\.ts\\'"    . typescript-ts-mode)
                ("\\.tsx\\'"   . tsx-ts-mode)
                ("\\.html\\'"  . web-mode)
                ("\\.css\\'"   . web-mode))
              auto-mode-alist))

;; Corfu In-Buffer Completion Setup
(use-package corfu
  :ensure t
  :custom
  (corfu-cycle t)                ;; Enable cycling for candidates
  (corfu-auto t)                 ;; Enable auto completion
  (corfu-auto-prefix 1)          ;; Minimum length for auto completion
  (corfu-auto-delay 0.0)         ;; Delay for auto completion
  (corfu-popupinfo-mode t)       ;; Enable documentation popup
  (corfu-popupinfo-delay '(0.5 . 0.2))
  :init
  (global-corfu-mode))

(use-package cape
  :ensure t
  :init
  (add-to-list 'completion-at-point-functions #'cape-file)
  (add-to-list 'completion-at-point-functions #'cape-dabbrev)
  (add-to-list 'completion-at-point-functions #'cape-keyword))

(use-package kind-icon
  :ensure t
  :after corfu
  :custom
  (kind-icon-default-face 'corfu-default)
  :config
  (add-to-list 'corfu-margin-formatters #'kind-icon-margin-formatter))

(use-package lsp-mode
  :ensure t
  :commands (lsp lsp-deferred)

  :hook
  ((java-mode
    js-mode typescript-mode typescript-ts-mode tsx-ts-mode
    web-mode) . lsp-deferred)

  :config

  (setq-default indent-tabs-mode t)       ;; Use Tabs 
  (setq-default tab-width 2)              ;; Visual width of a tab
  
  ;; Force Language Servers (TypeScript, etc.) to use 2 spaces for formatting
  (setq lsp-formatting-indent-size 2)

  (setq lsp-auto-guess-root t)
  (setq lsp-log-io nil)
  (setq lsp-restart 'auto-restart)
  (setq lsp-enable-symbol-highlighting nil)
  (setq lsp-enable-on-type-formatting nil)
  (setq lsp-signature-auto-activate nil)
  (setq lsp-signature-render-documentation nil)
  (setq lsp-eldoc-hook nil)
  (setq lsp-modeline-code-actions-enable nil)
  (setq lsp-modeline-diagnostics-enable nil)
  (setq lsp-headerline-breadcrumb-enable nil)
  (setq lsp-semantic-tokens-enable nil)
  (setq lsp-enable-folding nil)
  (setq lsp-enable-imenu nil)
  (setq lsp-enable-snippet nil)
  (setq read-process-output-max (* 1024 1024)) ;; 1MB
  (setq lsp-idle-delay 0.5))


(use-package lsp-java
  :after lsp)

(use-package lsp-ui
  :commands lsp-ui-mode
  
  :config
  (setq lsp-ui-doc-enable nil)
  (setq lsp-ui-doc-header t)
  (setq lsp-ui-doc-include-signature t)
  (setq lsp-ui-doc-position 'at-point)
  (setq lsp-ui-doc-border (face-foreground 'default))
  (setq lsp-ui-sideline-show-code-actions nil)
  (setq lsp-ui-sideline-delay 0.05))

(provide 'init-lsp)
