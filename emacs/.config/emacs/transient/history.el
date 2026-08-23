((magit-commit
  ("--verbose"))
 (magit-diff
  ("--stat" "--no-ext-diff"
   ("--" "emacs/.config/emacs/lisp/init-evil.el")))
 (magit-dispatch nil)
 (magit-file-dispatch nil)
 (magit-log
  ("--show-signature" "--decorate" "--graph" "-n256")
  ("--decorate" "--graph" "-n256")
  ("--decorate" "--graph" "-n5"))
 (magit-log:-n "5")
 (magit-push nil)
 (magit-status-jump nil))
