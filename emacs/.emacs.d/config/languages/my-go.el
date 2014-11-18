(use-package go-mode
  :ensure go-mode
  :commands go-mode godoc
  :mode "\\.go\\'"
  :config
  (progn
    ; Set GOPATH
    (setenv "GOPATH" "/Users/giodamelio/Projects/go")

    ; Run gofmt before save
    (setq gofmt-command "goimports")
    (setq exec-path (cons "/usr/lib/go/bin" exec-path))
    (add-to-list 'exec-path "/home/giodamelio/Projects/go/bin")
    (add-hook 'before-save-hook 'gofmt-before-save)

    ; Go autocomplete
    (use-package company-go
      :ensure company-go
      :config
      (progn
        ; Hook up company mode
        (add-to-list 'company-backends 'company-go)
      )
    )
  )
)

(provide 'my-go)

