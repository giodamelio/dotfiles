(use-package js-mode
  :mode ("\\.js\\'" . js-mode)
  :init
  (setq
   ; Configure prettier mode
   prettier-js-args '("--single-quote" "--trailing-comma" "es5"))
  (add-hook 'js-mode-hook 'prettier-js-mode)
  (require 'prettier-js))
