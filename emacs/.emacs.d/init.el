; Add repos
(setq package-archives '(("melpa" . "http://melpa.milkbox.net/packages/")
                         ("org" . "http://orgmode.org/elpa/")
                         ("gnu" . "http://elpa.gnu.org/packages/")))

; Load package manager
(require 'package)

; Load and activate packages
(package-initialize)

; Enable evil by default
; Keep this at the bottom
(require 'evil)
(evil-mode 1)

