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

;; Load all elisp scripts from config/
(cl-loop for file in (directory-files (concat user-emacs-directory "config/") t)
          when (string-match "\\.el$" file)
          do (condition-case ex
                (load file)
              ('error (with-current-buffer "*scratch*"
                        (insert (format "[INIT ERROR]\n%s\n%s\n\n" file ex))))))
