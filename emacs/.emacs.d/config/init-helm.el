(require-package 'helm)
(require 'helm)
(require 'helm-config)

(helm-mode 1) ; Enable helm mode to enhance common emacs commands

(global-set-key (kbd "M-x") 'helm-M-x) ; Replace normal M-x with Helm's M-x

(provide 'init-helm)
