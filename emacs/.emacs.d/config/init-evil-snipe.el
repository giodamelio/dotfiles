(use-package evil-snipe
  :ensure t
  :after evil
  :init
  (evil-snipe-override-mode 1)
  (add-hook 'magit-mode-hook 'turn-off-evil-snipe-override-mode))
