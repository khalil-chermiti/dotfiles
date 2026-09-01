;;; init-lsp.el --- LSP-mode setup for Emacs IDE -*- lexical-binding: t; -*-

;; Environment Handling
;; (use-package exec-path-from-shell
;;   :ensure t
;;   :config
;;   (when (memq window-system '(x pgtk pg wayland))
;;     (exec-path-from-shell-copy-env "NVM_DIR")
;;     (exec-path-from-shell-initialize)))

;; Manually adding executable to exec-path and path
(dolist (path '("~/.local/bin"
                "~/.nvm/versions/node/v24.14.1/bin"))
  (let ((path (expand-file-name path)))
    (add-to-list 'exec-path path)
    (setenv "PATH"
            (concat path ":" (getenv "PATH")))))

(setq auto-mode-alist
      (append '(("\\.java\\'" . java-mode)
                ("\\.js\\'"   . js-mode)
                ("\\.ts\\'"   . typescript-ts-mode)
                ("\\.tsx\\'"  . tsx-ts-mode)
                ("\\.html\\'" . web-mode)
                ("\\.css\\'"  . web-mode))
              auto-mode-alist))

(use-package company
  :ensure t
  :custom
  (company-minimum-prefix-length 1)     
  (company-idle-delay 0.0)              
  (company-echo-delay 0)
  (company-selection-wrap-around t)     
  (company-tooltip-align-annotations t)  ; Aligns descriptions/types on the right
  (company-tooltip-limit 6)            
  (company-show-numbers nil)
  (company-dabbrev-downcase nil)
  (company-search-freely-indicator t)   

  :config
  ;; Ensure quick documentation display style matches a popup framework if available
  (setq company-backends '(company-capf
                           company-files
                           company-keywords))
  :hook
  (prog-mode . company-mode))

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
