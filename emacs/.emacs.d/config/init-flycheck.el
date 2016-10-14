(use-package flycheck
  :ensure t
  :diminish flycheck-mode
  :init
  (global-flycheck-mode)
  (flycheck-add-mode 'javascript-eslint 'js-mode)
  (flycheck-add-mode 'javascript-eslint 'js2-mode)
  (flycheck-add-mode 'javascript-eslint 'web-mode)

  (defun my/use-eslint-from-node-modules ()
    (let* ((root (locate-dominating-file (or (buffer-file-name) default-directory) "node_modules"))
	    (eslint (and root (expand-file-name "node_modules/.bin/eslint" root))))
	(when (and eslint (file-executable-p eslint))
	(setq flycheck-javascript-eslint-executable eslint))))

  (add-hook 'flycheck-mode-hook #'my/use-eslint-from-node-modules))
