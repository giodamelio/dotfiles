(use-package evil
  :ensure t
  :after evil-leader
  :config
  (evil-mode)
  (evil-leader/set-key
    "c" 'comment-or-uncomment-region
    "k" 'kill-this-buffer
    "K" 'kill-buffer
  ))
