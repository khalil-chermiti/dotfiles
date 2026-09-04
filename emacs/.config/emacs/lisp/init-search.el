;;; init-completion.el --- Complete Minibuffer Completion Framework -*- lexical-binding: t; -*-

(require 'use-package)

(use-package vertico
  :init
  (vertico-mode 1)
  
  :custom
  (vertico-cycle t)

  :custom-face
  (vertico-group-title ((t (:background unspecified :box nil)))); remove vertico grouping highlight

  :bind
  (:map minibuffer-local-map
        ("C-j" . vertico-next)
        ("C-k" . vertico-previous)))

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
  ;; preview selection with consult
  (setq register-preview-delay 0.5)
  (setq register-preview-function #'consult-register-format)
  (advice-add #'register-preview :override #'consult-register-window)

  ;; consult for definition jump
  (setq xref-show-xrefs-function #'consult-xref)
  (setq xref-show-definitions-function #'consult-xref)

  :config
  ;; include hidden files
  (setopt consult-ripgrep-args (concat consult-ripgrep-args " --hidden "))
  (setq consult-fd-args "fd --color=never --hidden --type f")

  ;; add debounce when searching for a line
  (consult-customize consult-line :preview-key '(:debounce 0.2 any)))

(use-package isearch
  :ensure nil
  :custom
  (isearch-lazy-count t)
  (isearch-wrap-pause 'no)
  (isearch-allow-scroll t)
  (search-upper-case t)
  (case-fold-search t)
  (lazy-count-prefix-format "%s/%s ")
  :config
  (defun my-occur-from-isearch ()
    (interactive)
    (let ((query (if isearch-regexp
               isearch-string
             (regexp-quote isearch-string))))
      (isearch-update-ring isearch-string isearch-regexp)
      (let (search-nonincremental-instead)
        (ignore-errors (isearch-done t t)))
      (occur query)))
  :bind
  (:map isearch-mode-map
        ("C-o" . my-occur-from-isearch))
  )

(use-package embark
  :ensure t
  :bind
  (("C-;" . embark-act)
   ("C-," . embark-dwim))

  :config
  (setq embark-mixed-indicator-delay 0.0)
  (setq embark-cycle-key "<tab>")
  (setq embark-prompter #'embark-completing-read-prompter) 

  (setq embark-indicators
        '(embark-minimal-indicator
          embark-highlight-indicator
          embark-isearch-highlight-indicator)))

(provide 'init-search)
;;; init-completion.el ends here
