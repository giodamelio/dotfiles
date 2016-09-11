(use-package elixir-mode
  :ensure t)

(use-package alchemist
  :ensure t
  :after elixir-mode
  :after evil-leader
  :init
  (evil-leader/set-key-for-mode 'elixir-mode
    "d" 'alchemist-help-search-at-point))
