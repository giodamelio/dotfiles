(use-package git-gutter-fringe
  :ensure git-gutter
  :ensure fringe-helper
  :ensure git-gutter-fringe
  :diminish git-gutter-mode
  :after eyecandy
  :init
  (global-git-gutter-mode) ; Enable git-gutter everywhere
  (git-gutter:linum-setup) ; Make it compatable with linum-mode
  )
