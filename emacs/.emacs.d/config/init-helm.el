(require-package 'helm)
(require 'helm)
(require 'helm-config)

(helm-mode 1) ; Enable helm mode to enhance common emacs commands

;; Replace normal M-x with Helm's M-x
(global-set-key (kbd "M-x") 'helm-M-x)
(setq helm-M-x-fuzzy-match t) ; Use fuzzy matching

(after 'evil-leader
    ;; Setup helm-mini
    (evil-leader/set-key "p" 'helm-mini)
    (evil-leader/set-key "<SPC>" 'helm-mini)
    (setq helm-buffers-fuzzy-matching t
	  helm-recentf-fuzzy-match    t))

(define-key helm-map (kbd "<tab>") 'helm-execute-persistent-action) ; Rebind tab to run persistent action
(define-key helm-map (kbd "C-i") 'helm-execute-persistent-action) ; Make TAB work in terminal
(define-key helm-map (kbd "C-z")  'helm-select-action) ; List actions using C-z
(global-set-key (kbd "M-y") 'helm-show-kill-ring) ; Show the kill-ring

(provide 'init-helm)
