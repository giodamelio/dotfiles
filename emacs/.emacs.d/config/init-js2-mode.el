(use-package js2-mode
  :ensure t
  :init
  ;; (add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))
  (setq
   js2-strict-missing-semi-warning nil ; Disable semi-colon warning
   js2-basic-offset 2 ; Indent with two spaces
  ))
