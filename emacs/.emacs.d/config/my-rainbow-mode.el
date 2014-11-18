(use-package rainbow-mode
  :ensure
  :init
  (progn
    (add-hook 'prog-mode-hook 'rainbow-turn-on)
  )
)

(provide 'my-rainbow-mode)

