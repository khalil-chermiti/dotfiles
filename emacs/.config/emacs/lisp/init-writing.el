;;; init-writing.el --- Writing Configuration -*- lexical-binding: t; -*-

;; =================================================================
;; Org-mode Configuration
;; =================================================================

(use-package org
  :ensure nil
  :hook (org-mode . visual-line-mode)
  :custom
  (org-directory "~/Org")
  (org-agenda-files '("~/Org/tasks.org"))
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
      "* %U\n%?")
     ("p" "Poetry" entry (file+headline "poetry.org" "Poems")
      "* \n- الشاعر: \n- النوع: \n\n%i%?")))

  :custom-face
  (org-level-1 ((t (:height 1.15 :weight bold))))
  (org-level-2 ((t (:height 1.1 :weight bold))))
  (org-level-3 ((t (:height 1.05 :weight bold))))
  (org-level-4 ((t (:height 1.0 :weight bold))))
  (org-level-5 ((t (:height 1.0 :weight bold))))
  (org-level-6 ((t (:height 1.0 :weight bold))))
  (org-level-7 ((t (:height 1.0 :weight bold))))
  (org-level-8 ((t (:height 1.0 :weight bold)))))

(use-package org-roam
  :ensure t
  :custom
  (org-roam-directory "~/Org/Roam")
  (org-roam-completion-everywhere t)
  :config
  (org-roam-db-autosync-mode))

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
      ("oreoa" "الرأي:\nالسبب:\nالمثال:\nالرأي:" nil :system t))))

;; =================================================================
;; Dictionary Search 
;; =================================================================

(use-package dictionary
  :ensure nil
  :init (setq dictionary-server "dict.org")
  :config
  (defun my/dictionary ()
    "Prompt to choose a dictionary and search via dict.org."
    (interactive)
    (let* ((dicts '(("French -> English" . "fd-fra-eng")
                    ("English -> French" . "wn")))
           (choice (completing-read "Select dictionary: " dicts nil t))
           (dictionary-default-dictionary (alist-get choice dicts nil nil 'string=)))
      (call-interactively #'dictionary-search))))

;; translate with Google translate.
(use-package gt
  :ensure t
  :custom
  (gt-polyglot-p t)
  :config
  (defun my/translate ()
    "Prompt to choose a translation direction and translate."
    (interactive)
      (gt-start
       (make-instance 'gt-translator
        :taker (gt-taker :prompt t  :langs '(en fr ar)) ;; when prompted use Ctrl+n or Ctrl+p to change direction of translation
        :engines (gt-google-engine)
        :render (gt-buffer-render)))))

;; I externally use aspell program to get suggestions and corrections
;; Aspell takes a list of command line args to tweak it.
;; Find options here: http://aspell.net/man-html/The-Options.html
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
    "Toggle Flyspell, set the dictionary, and update cape-dict."
    (interactive)
    (if flyspell-mode
        (progn
          (flyspell-mode -1)
          (message "Flyspell disabled."))
      
      ;; Select the dictionary
      (call-interactively #'ispell-change-dictionary)

      ;; Configure cape-dict based on the selected ispell dictionary
      (setq-local cape-dict-file
                  (if (string-prefix-p "fr" ispell-current-dictionary)
                      "/usr/share/dict/french"
                    "/usr/share/dict/words"))

      ;; Add cape-dict to capf locally if not already there
      (add-hook 'completion-at-point-functions #'cape-dict nil t)

      (flyspell-mode 1)

      (unless (bound-and-true-p corfu-mode)
        (corfu-mode 1))
      
      (message "Flyspell enabled with %s (Dict: %s)." 
               ispell-current-dictionary 
               (file-name-nondirectory cape-dict-file))))

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
  :after flyspell
  :bind (("M-$" . flyspell-correct-wrapper)))

(provide 'init-writing)
