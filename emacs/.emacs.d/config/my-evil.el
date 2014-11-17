; Setup evil
(use-package evil
  :ensure evil
  :config
  (progn
    (evil-mode 1)

    ; Easy switching between windows
    (define-key evil-normal-state-map (kbd "C-h") 'evil-window-left)
    (define-key evil-normal-state-map (kbd "C-j") 'evil-window-down)
    (define-key evil-normal-state-map (kbd "C-k") 'evil-window-up)
    (define-key evil-normal-state-map (kbd "C-l") 'evil-window-right)
  ))

; Export it
(provide 'my-evil)

