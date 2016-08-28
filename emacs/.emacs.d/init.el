(require 'cl)
(require 'package)

;; Define the directory to load config scripts from
(let ((config-directory (concat user-emacs-directory "config/")))

  ;; Setup package manager
  (setq package-archives '(("melpa" . "http://melpa.org/packages/")
                           ("org" . "http://orgmode.org/elpa/")
                           ("gnu" . "http://elpa.gnu.org/packages/")))
  (setq package-enable-at-startup nil)
  (package-initialize)

  ;; Load all the config scripts
  (cl-loop for file in (directory-files config-directory t)
           when (string-match "\\.el$" file)
           do (condition-case ex
                  (load file)
                ('error (with-current-buffer "*scratch*"
                          (insert (format "[INIT ERROR]\n%s\n%s\n\n" file ex)))))))
