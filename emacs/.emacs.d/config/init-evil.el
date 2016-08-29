(require-package 'evil)
(require 'evil)
(evil-mode)

;; Make "jk" exit insert mode and exit a bunch of other modes
(require-package 'evil-escape)
(require 'evil-escape)
(evil-escape-mode)
(setq evil-escape-key-sequence "jk")

(provide 'init-evil)
