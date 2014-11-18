(use-package guide-key
  :ensure
  :config
  (progn
    (setq guide-key/guide-key-sequence '("C-x"))
    (guide-key-mode 1)
  )
)

(provide 'my-guide-key)

