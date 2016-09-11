(use-package evil
  :ensure t
  :after evil-leader
  :config
  (evil-mode)
  ;; Make :W act the same as w
  (evil-ex-define-cmd "W" 'evil-write)
  ;; Add some leader keybindings
  (evil-leader/set-key
    "c" 'comment-or-uncomment-region
    "k" 'kill-this-buffer
    "K" 'kill-buffer
  ))
