(use-package project
  :ensure nil
  :custom
  (project-list-file (locate-user-emacs-file "project-list.cache"))

  (project-vc-extra-root-markers '(".env" "package.json"))

  (project-switch-commands 
   '((consult-fd "Find file" ?f)
     (consult-ripgrep "Find regexp" ?g)
     (project-find-dir "Find directory" ?d)
     (magit-project-status "Magit" ?m)))

  :config
  (dolist (key '("!" "&" "c" "o" "v" "F" "G" "C-b" "D" "x"))
    (keymap-unset project-prefix-map key))

  (keymap-set project-prefix-map "f" #'consult-fd)
  (keymap-set project-prefix-map "b" #'project-buffers)
  (keymap-set project-prefix-map "d" #'project-dired)
  (keymap-set project-prefix-map "g" #'consult-ripgrep)
  (keymap-set project-prefix-map "m" #'magit-project-status))

(provide 'init-project)
