;;; init.el --- Main Entry Point -*- lexical-binding: t; -*-

;; -----------------------------------------------------------------------------
;; 1. Package System Setup
;; -----------------------------------------------------------------------------

(require 'package)

(setq package-archives '(("melpa" . "https://melpa.org/packages/")
                         ("nongnu" . "https://elpa.nongnu.org/nongnu/")
                         ("elpa" . "https://elpa.gnu.org/packages/")))

(package-initialize)

(unless package-archive-contents
  (package-refresh-contents))

;; Ensure use-package is installed (necessary for Emacs 28 and older)
(unless (package-installed-p 'use-package)
  (package-install 'use-package))

(require 'use-package)
(setq use-package-always-ensure t)

;; Add custom module folder (~/.emacs.d/lisp) to load-path
(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))

;; Keep auto-generated 'custom-set-variables' out of init.el
(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(when (file-exists-p custom-file)
  (load custom-file 'noerror))

;; -----------------------------------------------------------------------------
;; 2. Load Custom Modules
;; -----------------------------------------------------------------------------

(require 'init-dashboard)
(require 'init-ui)
(require 'init-magit)
(require 'init-evil)
(require 'init-files)
(require 'init-completion)
(require 'init-org)
(require 'init-lsp)

;;; init.el ends here
