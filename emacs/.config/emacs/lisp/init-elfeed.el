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
          ("https://www.ahewar.org/rss/default.asp?lt=4&i=241" صحة-نفسية-جسدية)
          ("https://www.ahewar.org/rss/default.asp?lt=4&i=274" قضايا-ثقافية)
          ("https://www.ahewar.org/rss/default.asp?lt=4&i=226" نسوية عنف-منزل حقوق-المرأة)))

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


  ;; Extract article body from ahewar.org
  (defun my/parse-ahewar-article (url)
    "Fetch an Ahewar article, extract 'artTextmain', and open in eww."
    (let ((temp-file (make-temp-file "ahewar-article-" nil ".html")))
      (with-temp-buffer
        ;; 1. Fetch content
        (let ((url-request-extra-headers '(("Accept-Encoding" . "identity"))))
          (url-insert-file-contents url))
        
        (decode-coding-region (point-min) (point-max) 'utf-8)
        
        ;; 2. Parse and Extract
        (let* ((dom (libxml-parse-html-region (point-min) (point-max)))
               (meta-list (dom-by-tag dom 'meta))
               (desc-node (seq-find (lambda (node)
                                      (let ((name (dom-attr node 'name)))
                                        (and name (string-equal (downcase name) "description"))))
                                    meta-list))
               (title (and desc-node (dom-attr desc-node 'content)))
               (target (car (dom-by-class dom "artTextmain"))))
          
          (if (not target)
              (error "Could not find 'artTextmain' in the provided URL")
            
            ;; 3. Prepare Buffer for EWW
            (erase-buffer)
            (insert "<html><body>")
            (when title
              (insert (format "<h1>%s</h1><hr>" title)))
            
            (insert "<div>")
            (shr-insert-document target) ;; insert DOM
					  ;; <br> are sometimes emmited so we need to insert them back
            (save-excursion
              (goto-char (point-min))
              (while (re-search-forward "\r?\n" nil t)
                (replace-match "<br>\n" nil nil))) ;; The cursor is now after the \n, so the loop continues safely
            (insert "</div>")
            (insert "</body></html>")
            
            ;; 4. Save and open
            (set-buffer-file-coding-system 'utf-8)
            (write-region nil nil temp-file))))
      
      (eww-open-file temp-file)))


  (defun my/eww-open ()
    "Extract URL at point and process accordingly."
    (interactive)
    (let ((url (thing-at-point-url-at-point)))
      (cond
       ((and url (string-search "ahewar" url)) (my/parse-ahewar-article url)) ;; if url is ahewar.org
       (url  (eww url)) ;; open url
       (t (call-interactively 'eww)))))) ;; prompt for url

(provide 'init-elfeed)
;;; my-elfeed.el ends here
