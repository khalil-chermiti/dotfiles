;;; init-gptel.el --- Gptel Gemini Configuration -*- lexical-binding: t; -*-

(use-package gptel
  :ensure t
  :config
  (setq gptel-backend
        (gptel-make-gemini "Gemini"
	  ;; Get auth key from ~/.authinfo
	  ;; machine ai.google.dev login apikey password api_key_here
          :key (lambda ()
                 (let* ((auth (car (auth-source-search :host "ai.google.dev" :user "apikey")))
                        (secret (plist-get auth :secret)))
                   (cond
                    ((functionp secret) (funcall secret))
                    ((stringp secret) secret)
                    (t (error "Gemini API key not found in auth-source")))))
          :stream t))

  (setq gptel-model 'gemini-3.1-flash-lite)

  (setq gptel-prompt-prefix-alist
	'((markdown-mode . "❖ ")
	  (text-mode     . "❖ ")
	  (org-mode      . "❖ ")))

  (setq gptel-response-prefix-alist
	'((markdown-mode . "🤖 Gemini\n")
	  (text-mode     . "🤖 Gemini\n")
	  (org-mode      . "🤖 Gemini\n"))))

(provide 'init-gptel)
;;; init-gptel.el ends here
