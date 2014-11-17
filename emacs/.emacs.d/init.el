; Add directories to path
(add-to-list 'load-path (concat user-emacs-directory "config"))

; Add repos
(setq package-archives '(("melpa" . "http://melpa.milkbox.net/packages/")
                         ("org" . "http://orgmode.org/elpa/")
                         ("gnu" . "http://elpa.gnu.org/packages/")))

; Setup load packages
(require 'package)
(package-initialize)
(setq package-enable-at-startup nil)

; Make sure use-package is installed
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))
(require 'use-package)

; Load themes
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes/")

; Set theme to molokai
(load-theme 'molokai t)

; Setup slime-nav
(progn
  (require 'elisp-slime-nav)
  (defun my-load-slime ()
    (elisp-slime-nav-mode)
    (turn-on-eldoc-mode)
    )
  (add-hook 'emacs-lisp-mode-hook 'my-load-slime)
)

(require 'my-evil)

