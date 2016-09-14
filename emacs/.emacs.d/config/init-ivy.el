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
  :after ivy)
