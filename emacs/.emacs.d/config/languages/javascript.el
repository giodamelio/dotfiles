(use-package js-mode
  :mode ("\\.js\\'" . js-mode)
  :init
  (setq
   ; Configure prettier mode
   prettier-js--prettier-args '("--single-quote" "--trailing-comma" "es5"))
  (add-hook 'js-mode-hook 'prettier-mode))
