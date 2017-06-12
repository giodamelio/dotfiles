;; Stop emacs from adding crap to my files
(setq package--init-file-ensured t)

;; Detect if I want to load my config or use spacemacs
(setq use-spacemacs (getenv "USE_SPACEMACS"))
(when use-spacemacs
  (setq user-emacs-directory "~/.spacemacs.d/"))   ; defaults to ~/.emacs.d/

(load (expand-file-name "init.el" user-emacs-directory))
