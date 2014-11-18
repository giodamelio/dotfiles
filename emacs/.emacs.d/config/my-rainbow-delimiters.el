(use-package rainbow-delimiters
  :ensure
  :config
  (progn
    ; Use in all programming modes
    (add-hook 'prog-mode-hook 'rainbow-delimiters-mode)
  )
)

(provide 'my-rainbow-delimiters)

