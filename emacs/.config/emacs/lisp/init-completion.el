;;; init-completion.el --- Complete Minibuffer Completion Framework -*- lexical-binding: t; -*-

(require 'use-package)

;; =============================================================================
;; 1. VERTICO (Interactive Minibuffer UI)
;; =============================================================================
(use-package vertico
  :init
  (vertico-mode 1)
  :custom
  (vertico-cycle t))

;; Persist minibuffer history across Emacs sessions
(use-package savehist
  :ensure nil
  :init
  (savehist-mode 1))

;; =============================================================================
;; 2. ORDERLESS (Fuzzy/Pattern Matching Style)
;; =============================================================================
(use-package orderless
  :custom
  (completion-styles '(orderless basic))
  (completion-category-defaults nil)
  (completion-category-overrides '((file (styles partial-completion)))))

;; =============================================================================
;; 3. MARGINALIA (Rich Annotations in Minibuffer)
;; =============================================================================
(use-package marginalia
  :init
  (marginalia-mode 1))

;; =============================================================================
;; 4. CONSULT (Search, Navigation, and Buffers)
;; =============================================================================
(use-package consult
  :ensure t
  :init
  ;; Integrate Consult with Emacs register preview
  (setq register-preview-delay 0.5
        register-preview-function #'consult-register-format)

  (advice-add #'register-preview :override #'consult-register-window)

  ;; Use Consult to select xref locations (e.g. definition jumps)
  (setq xref-show-xrefs-function #'consult-xref
        xref-show-definitions-function #'consult-xref)

  :custom
  ;; Narrowing key prefix for filtering sources in consult-buffer
  (consult-narrow-key "<")

  :config
  ;; Live Preview Rules
  (consult-customize
   ;; Live preview with 0.2s debounce for fast searching
   consult-line consult-imenu
   :preview-key '(:debounce 0.2 any)

   ;; Heavy file/project searches: preview manually with M-. to avoid lag
   consult-ripgrep consult-git-grep consult-grep
   :preview-key "M-."

   ;; Disable preview for themes
   consult-theme :preview-key nil))

;; =============================================================================
;; 5. ISEARCH (Built-in Incremental Search)
;; =============================================================================
(use-package isearch
  :ensure nil
  :custom
  (isearch-lazy-count t)
  (isearch-wrap-pause 'no)
  (isearch-allow-scroll t)
  (search-upper-case t)
  (case-fold-search t)
  (lazy-count-prefix-format "%s/%s "))

(provide 'init-completion)
;;; init-completion.el ends here
