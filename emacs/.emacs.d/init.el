; Add repos
(setq package-archives '(("melpa" . "http://melpa.milkbox.net/packages/")
                         ("org" . "http://orgmode.org/elpa/")
                         ("gnu" . "http://elpa.gnu.org/packages/")))

; Load package manager
(require 'package)

; Load and activate packages
(package-initialize)

; Setup slime-nav
(progn
  (require 'elisp-slime-nav)
  (defun my-load-slime ()
    (elisp-slime-nav-mode)
    (turn-on-eldoc-mode)
    )
  (add-hook 'emacs-lisp-mode-hook 'my-load-slime)
)

; Enable evil by default
; Keep this at the bottom
(require 'evil)
(evil-mode 1)

; Easy switching between windows
(define-key evil-normal-state-map (kbd "C-h") 'evil-window-left)
(define-key evil-normal-state-map (kbd "C-j") 'evil-window-down)
(define-key evil-normal-state-map (kbd "C-k") 'evil-window-up)
(define-key evil-normal-state-map (kbd "C-l") 'evil-window-right)

