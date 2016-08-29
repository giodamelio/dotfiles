(require-package 'helm)
(require 'helm-config)

(global-set-key (kbd "M-x") 'helm-M-x) ; Replace normal M-x with Helm's M-x

(provide 'init-helm)
