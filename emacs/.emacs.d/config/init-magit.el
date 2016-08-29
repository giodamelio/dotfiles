(use-package magit
  :ensure magit
  :ensure evil-magit
  :after evil
  :init
  (evil-magit-init)
  (evil-leader/set-key "g" 'magit-status))
