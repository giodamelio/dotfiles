(use-package js2-mode
  :ensure t
  :init
  (add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))
  :config
  (setq
   ; JS2-mode settings
   js2-strict-missing-semi-warning nil ; Disable semi-colon warning
   js2-basic-offset 2 ; Indent with two spaces

   ; Configure prettier mode
   prettier-js--prettier-args '("--single-quote" "--trailing-comma" "es5"))
  (add-hook 'js2-mode-hook 'prettier-mode))
