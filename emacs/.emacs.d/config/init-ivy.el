(use-package ivy
  :ensure t
  :diminish ivy-mode
  :config
  (ivy-mode)
  ;; Make ivy display a few more items
  (setq ivy-height 10)
  ;; Configure ivy matching engine
  (setq ivy-re-builders-alist
	;; Allow searches to be out of order
	'((t . ivy--regex-ignore-order))))

(use-package counsel
  :ensure t
  :after ivy
  :after evil-leader
  :config
  ;; Replace default M-x with counsel-M-x
  (global-set-key (kbd "M-x") 'counsel-M-x)
  (evil-leader/set-key "<SPC>" 'counsel-M-x))

(use-package counsel-projectile
  :ensure t
  :after counsel
  :after projectile
  :config
  (evil-leader/set-key "p" 'counsel-projectile-find-file))
