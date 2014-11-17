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

(require 'my-elisp-slime-nav)
(require 'my-evil)

