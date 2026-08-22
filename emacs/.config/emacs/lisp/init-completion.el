;;; init-completion.el --- Complete Minibuffer Completion Framework -*- lexical-binding: t; -*-

(require 'use-package)

(use-package vertico
  :init
  (vertico-mode 1)
  :custom
  (vertico-cycle t))


;; Remove Vertico group background highlight
(custom-set-faces
 '(vertico-group-title ((t (:background unspecified :box nil)))))

;; Bind Ctrl-j and Ctrl-k for smooth selection scrolling
(define-key minibuffer-local-map (kbd "C-j") 'vertico-next)
(define-key minibuffer-local-map (kbd "C-k") 'vertico-previous)

;; Persist minibuffer history across Emacs sessions
(use-package savehist
  :ensure nil
  :init
  (savehist-mode 1))

(use-package orderless
  :custom
  (completion-styles '(orderless basic))
  (completion-category-defaults nil)
  (completion-category-overrides '((file (styles partial-completion)))))

(use-package marginalia
  :init
  (marginalia-mode 1))

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
  (setopt consult-ripgrep-args (concat consult-ripgrep-args " --hidden "))
  (setq consult-fd-args "fd --color=never --hidden --type f") 
  (consult-customize
   consult-line consult-imenu
   :preview-key '(:debounce 0.2 any)))

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
