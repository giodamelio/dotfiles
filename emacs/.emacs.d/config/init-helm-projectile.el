(use-package helm-projectile
  :ensure t
  :after evil
  :init
  (evil-leader/set-key "p" 'helm-projectile))
