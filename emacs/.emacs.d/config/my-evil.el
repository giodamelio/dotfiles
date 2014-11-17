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

    ; Open helm-mini
    (evil-leader/set-key (kbd "a") 'helm-mini)
  )
)

; Setup evil
(use-package evil
  :ensure evil
  :config
  (progn
    (evil-mode 1)
    
    ; Color the cursor for different modes
    (setq evil-emacs-state-cursor   '("#dfaf8f" box))
    (setq evil-normal-state-cursor  '("#f8f893" box))
    (setq evil-insert-state-cursor  '("#f8f893" bar))
    (setq evil-replace-state-cursor '("#cc9393" box))

    ; Easy switching between windows
    (define-key evil-normal-state-map (kbd "C-h") 'evil-window-left)
    (define-key evil-normal-state-map (kbd "C-j") 'evil-window-down)
    (define-key evil-normal-state-map (kbd "C-k") 'evil-window-up)
    (define-key evil-normal-state-map (kbd "C-l") 'evil-window-right)
    
    ; Use ";" as ":"
    (define-key evil-normal-state-map (kbd ";") 'evil-ex)

    ; Use escape to exit minibuffer
    (define-key minibuffer-local-map [escape] 'my-minibuffer-keyboard-quit)
    (define-key minibuffer-local-ns-map [escape] 'my-minibuffer-keyboard-quit)
    (define-key minibuffer-local-completion-map [escape] 'my-minibuffer-keyboard-quit)
    (define-key minibuffer-local-must-match-map [escape] 'my-minibuffer-keyboard-quit)

    ; Open helm-M-x
    (define-key evil-normal-state-map (kbd "SPC SPC") 'helm-M-x)
  ))

; Export it
(provide 'my-evil)

