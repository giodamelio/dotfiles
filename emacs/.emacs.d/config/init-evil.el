(require-package 'evil)
(require 'evil)

(require-package 'evil-leader)
(require 'evil-leader)

(evil-leader/set-leader "<SPC>") ; Set leader to space

(global-evil-leader-mode)
(evil-mode)

;; Make "jk" exit insert mode and exit a bunch of other modes
(require-package 'evil-escape)
(require 'evil-escape)
(evil-escape-mode)
(setq evil-escape-key-sequence "jk")

(provide 'init-evil)
