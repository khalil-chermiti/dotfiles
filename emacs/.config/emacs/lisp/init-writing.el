;;; init-writing.el --- Writing Configuration -*- lexical-binding: t; -*-

;; =================================================================ar
;; Org-mode Configuration
;; =================================================================

(use-package org
  :ensure nil
  :hook (org-mode . visual-line-mode)
  :custom
  (org-directory "~/org")
  (org-agenda-files '("~/org"))
  (org-todo-keywords '((sequence "TODO(t)" "PROGRESS(p)" "DONE(d)")))
  (org-priority-highest ?A)
  (org-priority-lowest ?E)
  (org-priority-default ?A)
  (org-startup-folded 'content)
  (org-startup-indented nil)
  (org-adapt-indentation nil)
  (org-hide-leading-stars nil)
  (org-hide-emphasis-markers nil)
  (org-ellipsis "...")
  (org-table-auto-align t)
  (org-startup-with-inline-images nil)
  (org-src-preserve-indentation t)

  (org-capture-templates
   '(("t" "Todo" entry (file+headline "tasks.org" "Tasks")
      "* TODO  %?\n  %U\n")
     ("n" "Note" entry (file+datetree "notes.org")
      "* %?\n  %U\n  %i")
     ("j" "Journal" entry (file+datetree "journal.org")
      "* %U\n%?")))

  :custom-face
  (org-level-1 ((t (:height 1.15 :weight bold))))
  (org-level-2 ((t (:height 1.1 :weight bold))))
  (org-level-3 ((t (:height 1.05 :weight bold))))
  (org-level-4 ((t (:height 1.0 :weight bold))))
  (org-level-5 ((t (:height 1.0 :weight bold))))
  (org-level-6 ((t (:height 1.0 :weight bold))))
  (org-level-7 ((t (:height 1.0 :weight bold))))
  (org-level-8 ((t (:height 1.0 :weight bold)))))


;; =================================================================
;; Arabic Layout & Input Toggle Utility
;; =================================================================

(defvar-local my/arabic-mode-active nil
  "Tracks whether Arabic input and RTL layout are active in the current buffer.")

(defun my/toggle-arabic ()
  "Toggle Arabic mode: switches BIDI direction, input method, and Corfu completion."
  (interactive)
  (if my/arabic-mode-active
      (progn
        (setq bidi-paragraph-direction 'left-to-right)
        (toggle-input-method)
        (when (fboundp 'corfu-mode) (corfu-mode 1))
        (setq my/arabic-mode-active nil)
        (message "Arabic mode disabled (LTR, Corfu Enabled)"))
    (setq bidi-paragraph-direction 'right-to-left)
    (toggle-input-method)
    (when (bound-and-true-p corfu-mode) (corfu-mode -1))
    (setq my/arabic-mode-active t)
    (message "Arabic mode enabled (RTL, Corfu Disabled)")))


;; =================================================================
;; Writing Abbreviations (PEER, TEEL, OREO)
;; =================================================================

(use-package dabbrev
  :ensure nil
  :config
  (setq-default abbrev-mode t)

  (define-abbrev-table 'global-abbrev-table
    '(
      ("peer" "Point:\nEvidence:\nExplanation:\nRefinement:" nil :system t)
      ("teel" "Topic sentence:\nEvidence:\nExplanation:\nLink:" nil :system t)
      ("oreo" "Opinion:\nReason:\nExample:\nOpinion:" nil :system t)

      ("peera" "الفكرة:\nالدليل:\nالشرح:\nالتطوير:" nil :system t)
      ("teela" "الجملة المفتاحية:\nالدليل:\nالشرح:\nالرابط:" nil :system t)
      ("areoa" "الرأي:\nالسبب:\nالمثال:\nالرأي:" nil :system t))))

;; =================================================================
;; Dictionary Search 
;; =================================================================

(use-package dictionary
  :ensure nil
  :init
  (setq dictionary-server "dict.org")

  :config
  (defun my/dict-fr ()
    "Search dict.org using the French-to-English database (fd-fra-eng)."
    (interactive)
    (setq dictionary-default-dictionary "fd-fra-eng")
    (call-interactively 'dictionary-search))

  (defun my/dict-en ()
    "Search dict.org using the standard English database."
    (interactive)
    (setq dictionary-default-dictionary "wn")
    (call-interactively 'dictionary-search))

  (defun my/dictionary ()
    "Prompt to choose dictionary to find definition."
    (interactive)
    (let* ((choice (completing-read "Dictionary: " '("French -> English" "English -> French") nil t))
           (direction (intern choice)))
      (pcase choice
        ("French -> English" (my/dict-fr))
        ("English -> French" (my/dict-en))))))

;; =================================================================
;; Dictionary Search 
;; =================================================================
(use-package gt
  :ensure t
  :bind
  :config
  (defun my/gt-fr-to-en ()
    "Prompt for a French phrase and translate to English."
    (interactive)
    (gt-start
     (gt-translator
      :taker (gt-taker :prompt t :langs '(fr en))
      :engines (gt-google-engine)
      :render (gt-buffer-render))))

  (defun my/gt-en-to-fr ()
    "Prompt for an English phrase and translate to French."
    (interactive)
    (gt-start
     (gt-translator
      :taker (gt-taker :prompt t :langs '(en fr))
      :engines (gt-google-engine)
      :render (gt-buffer-render)))) ;; you can use gt-postframe-pop-render to render a pop window at current cursor position

  (defun my/translate ()
    "Prompt to choose a translation direction, then execute it."
    (interactive)
    (let* ((choice (completing-read "Translation direction: " '("French -> English" "English -> French") nil t))
           (direction (intern choice)))
      (pcase choice
        ("French -> English" (my/gt-fr-to-en))
        ("English -> French" (my/gt-en-to-fr))))))

;; I externally use aspell program to get suggestions and corrections
;; aspell takes a list of command line args to tweak it. url of the options: http://aspell.net/man-html/The-Options.html
(use-package flyspell
  :ensure nil
  :config
  (setq
   flyspell-mode nil
   ispell-program-name "aspell"
   ispell-extra-args '("--run-together"
                       "--run-together-limit=5"
                       "--ignore-case"
                       "--sug-mode=ultra" ;; Suggestion mode = ‘ultra’ | ‘fast’ | ‘normal’ | ‘slow’ | ‘bad-spellers’
                       "--ignore-accents"))

  (defun my/toggle-flyspell ()
    "Toggle Flyspell and select a dictionary. Uses prog-mode to avoid checking code."
    (interactive)
    (if flyspell-mode
        (progn
          (flyspell-mode -1)
          (message "Flyspell disabled."))
        
        (call-interactively #'ispell-change-dictionary)
        
        (flyspell-mode 1)
        
        (unless (bound-and-true-p corfu-mode)
          (corfu-mode 1))
        (message "Flyspell enabled with %s." ispell-current-dictionary)))


  ;; completion for accents
  (defun orderless-regexp-accent-insensitive (component)
    "Convert a component into a regex that ignores accents."
    (let ((chars '(("a" . "[aàâ]")
                   ("e" . "[eéèêë]")
                   ("i" . "[iîï]")
                   ("o" . "[oôö]")
                   ("u" . "[uûüù]")
                   ("c" . "[cç]"))))
      (let ((pattern (orderless-regexp component)))
        (dolist (pair chars)
          (setq pattern (replace-regexp-in-string (car pair) (cdr pair) pattern)))
        pattern)))

  (setq orderless-matching-styles 
        '(orderless-regexp-accent-insensitive)))

(use-package flyspell-correct
  :after flyspell)

(provide 'init-writing)
;;; init-org.el ends here
