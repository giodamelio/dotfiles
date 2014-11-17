(use-package helm
  :ensure helm
  :config
  (progn
    ; Replace M-x
    (global-set-key (kbd "M-x") 'helm-M-x)

    ; Fuzzy match buffers
    (setq helm-buffers-fuzzy-matching t)

    ; Open helm inside current window
    (setq helm-split-window-in-side-p t)

    ; Wrap at beginning and end
    (setq helm-move-to-line-cycle-in-source t)

    ; Persustent action
    (define-key helm-map (kbd "<tab>") 'helm-execute-persistent-action)

    ; Show actions
    (define-key helm-map (kbd "C-z")  'helm-select-action)

    (after 'evil-leader
      ; Open helm-mini
      (evil-leader/set-key (kbd "a") 'helm-mini)

      ; Find files
      (evil-leader/set-key (kbd "p") 'helm-find-files)

      ; Find in current file
      (evil-leader/set-key (kbd "o") 'helm-occur)
    )

    (use-package helm-ag
      :ensure helm-ag
      :config
      (progn
        (setq helm-ag-base-command "ag --nocolor --nogroup --ignore-case")
      )
    )
  )
)

(provide 'my-helm)

