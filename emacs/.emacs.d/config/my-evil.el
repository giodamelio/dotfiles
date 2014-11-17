; Setup evil-leader
(use-package evil-leader
  :commands (evil-leader-mode global-evil-leader-mode)
  :ensure evil-leader
  :demand evil-leader
  :init
  (progn
    ; Set leader to space
    (evil-leader/set-leader "<SPC>")
    (global-evil-leader-mode t)

    ; Save a buffer
    (evil-leader/set-key (kbd "w") 'save-buffer)
  )
)

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
    
    ; Use ";" as ":"
    (define-key evil-normal-state-map (kbd ";") 'evil-ex)
  ))

; Export it
(provide 'my-evil)

