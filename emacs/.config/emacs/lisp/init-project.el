(use-package project
  :ensure nil
  :custom
  (project-list-file (locate-user-emacs-file "project-list.cache"))

  (project-vc-extra-root-markers '(".env" "package.json"))

  (project-switch-commands 
   '((project-find-file "Find file" ?f)
     (project-find-dir "Find directory" ?D)
     (project-dired "dired" ?d)
     (project-find-regexp "Find regexp" ?g)
     (consult-project-buffer "Find buffer" ?b)
     (magit-project-status "Magit" ?m)
     (project-eshell "Eshell" ?e)))
  :config
  (keymap-set project-prefix-map "m" #'magit-project-status))

(provide 'init-project)
