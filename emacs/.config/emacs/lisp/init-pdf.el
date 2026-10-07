(use-package pdf-tools
  :ensure t
  :defer t
  :magic ("%PDF" . pdf-view-mode)
  :config
  (pdf-tools-install)
  
	(setq pdf-view-slice-display-sliced-pdf-p nil)
	(setq pdf-view-display-cursor nil)
	(setq-default cursor-in-non-selected-windows nil)
  (setq-default pdf-view-display-size 'fit-page)
  (setq pdf-annot-activate-created-annotations t
        pdf-view-resize-factor 1.1)
  
  (define-key pdf-view-mode-map (kbd "<down>") 'pdf-view-next-page)
  (define-key pdf-view-mode-map (kbd "<up>") 'pdf-view-previous-page)

  ;; 2. Width and Zoom Controls
  (define-key pdf-view-mode-map (kbd "W") 'pdf-view-fit-width-to-window)
  (define-key pdf-view-mode-map (kbd "+") 'pdf-view-enlarge)
  (define-key pdf-view-mode-map (kbd "-") 'pdf-view-shrink)
  (define-key pdf-view-mode-map (kbd "=") 'pdf-view-fit-page-to-window)
	
  (add-hook 'pdf-view-mode-hook (lambda () (pdf-view-midnight-minor-mode 1))))

(provide 'init-pdf)
