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
  (org-todo-keywords '((sequence "TODO(t)" "DONE(d)")))
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
      "* %U\n  %?")))

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

(setq-default abbrev-mode t)

(define-abbrev-table 'global-abbrev-table
  '(
    ("peer" "Point:\nEvidence:\nExplanation:\nRefinement:" nil :system t)
    ("teel" "Topic sentence:\nEvidence:\nExplanation:\nLink:" nil :system t)
    ("oreo" "Opinion:\nReason:\nExample:\nOpinion:" nil :system t)

    ("peera" "الفكرة:\nالدليل:\nالشرح:\nالتطوير:" nil :system t)
    ("teela" "الجملة المفتاحية:\nالدليل:\nالشرح:\nالرابط:" nil :system t)
    ("areoa" "الرأي:\nالسبب:\nالمثال:\nالرأي:" nil :system t)))

(provide 'init-writing)
;;; init-org.el ends here
