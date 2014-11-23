(use-package diff-hl
  :ensure diff-hl
  :init (global-diff-hl-mode)
  :config (add-hook 'vc-checkin-hook 'diff-hl-update)
)

(provide 'my-diff-hl)

