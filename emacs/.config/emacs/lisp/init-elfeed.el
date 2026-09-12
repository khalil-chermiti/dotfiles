;;; my-elfeed.el --- Elfeed RSS configuration -*- lexical-binding: t; -*-

(use-package elfeed
  :ensure t
  :config
  (setq elfeed-feeds
        '(
	  ;; الحور المتمدن
          ("https://www.ahewar.org/rss/default.asp?lt=4&i=163" علاقات-أسرة)
          ("https://www.ahewar.org/rss/default.asp?lt=4&i=158" فلسفة علم-نفس علم-اجتماع)
          ("https://www.ahewar.org/rss/default.asp?lt=4&i=139" علمانية دين)
          ("https://www.ahewar.org/rss/default.asp?lt=4&i=141" فلسطين)
          ("https://www.ahewar.org/rss/default.asp?lt=4&i=142" حقوق-إنسان)
          ("https://www.ahewar.org/rss/default.asp?lt=4&i=226" نسوية عنف-منزل حقوق-المرأة)

          )))

;; (use-package elfeed-goodies
;;   :ensure t
;;   :config
;;   (elfeed-goodies/setup))


(defface my/elfeed-small-title-face
  '((t (:inherit elfeed-search-title-face :height 0.9)))
  "Custom smaller face for Elfeed titles.")

(defun my/elfeed-search-print-entry (entry)
  "Print ENTRY with date and a smaller title."
  (let* ((date (elfeed-entry-date entry))
         (date-string (format-time-string "%Y-%m-%d" (seconds-to-time date)))
         (title (or (elfeed-entry-title entry) ""))
         (base-faces (elfeed-search--faces (elfeed-entry-tags entry)))
         ;; Merge standard unread/tag faces with our smaller height property
         (title-faces (if (listp base-faces)
                          (append base-faces '(:height 0.9))
                        (list base-faces '(:height 0.9)))))
    (insert (propertize (concat date-string " ") 'face 'elfeed-search-date-face))
    (insert (propertize title 'face title-faces))))

(setq elfeed-search-print-entry-function #'my/elfeed-search-print-entry)

(provide 'init-elfeed)

;;; my-elfeed.el ends here
