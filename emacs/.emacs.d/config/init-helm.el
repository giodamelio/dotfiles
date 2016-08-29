(require-package 'helm)
(require 'helm)
(require 'helm-config)

(helm-mode 1) ; Enable helm mode to enhance common emacs commands

(global-set-key (kbd "M-x") 'helm-M-x) ; Replace normal M-x with Helm's M-x
(define-key helm-map (kbd "<tab>") 'helm-execute-persistent-action) ; Rebind tab to run persistent action
(define-key helm-map (kbd "C-i") 'helm-execute-persistent-action) ; Make TAB work in terminal
(define-key helm-map (kbd "C-z")  'helm-select-action) ; List actions using C-z

(provide 'init-helm)
