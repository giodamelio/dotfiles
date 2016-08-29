(use-package eyecandy
  :ensure linum-relative
  :init
  (show-paren-mode) ; Highlight matching paren
  (global-linum-mode t) ; Show line numbers
  (global-hl-line-mode t) ; Highlight the current line
  (setq inhibit-startup-screen t) ; Disable startup screen
  (tool-bar-mode -1) ; Disable the toolbar
  (linum-relative-global-mode) ; Enable relative line numbers
  )
