(require 'cl)

;; Setup package.el
(require 'package)
(setq package-archives '(
  ("melpa" . "http://melpa.org/packages/")
  ("org" . "http://orgmode.org/elpa/")
  ("gnu" . "http://elpa.gnu.org/packages/")))
(setq package-enable-at-startup nil)
(package-initialize)

;; Make sure use-package is installed
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(require 'use-package)
(require 'diminish)
(require 'bind-key)

;; Load prettier. Stop gap until branch `prettier-js-prettify-region` is merged and on melpa
(add-to-list 'load-path "~/.emacs.d/files")

;; Load all elisp scripts from config/
(mapc 'load (append
	     (file-expand-wildcards (concat user-emacs-directory "config/*.el"))
	     (file-expand-wildcards (concat user-emacs-directory "config/languages/*.el"))))
