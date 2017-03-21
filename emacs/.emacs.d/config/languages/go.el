(use-package go
  :ensure go-mode
  :ensure go-eldoc
  :ensure godoctor
  :ensure company-go
  :after company
  :init
  ; Use goimports instead of go-fmt
  (setq gofmt-command "goimports")

  ; Call Gofmt before saving
  (add-hook 'before-save-hook 'gofmt-before-save)

  ; Setup eldoc for go
  (add-hook 'go-mode-hook 'go-eldoc-setup))
