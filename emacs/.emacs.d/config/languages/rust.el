(use-package rust
  :ensure rust-mode
  :ensure racer
  :after evil
  :init
  (setq
   racer-rust-src-path "~/Projects/forks/rust/src" ; Tell racer where to find rust
  )

  ; Enable racer in rust buffers
  (add-hook 'rust-mode-hook #'racer-mode)
  (add-hook 'racer-mode-hook #'eldoc-mode)

  ; Bind some keys
  (evil-leader/set-key
    "h" 'racer-describe
  ))
