(use-package company-tern
  :ensure t
  :after company
  :init
  (add-to-list 'company-backends 'company-tern))
