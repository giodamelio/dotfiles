; Setup elisp-slime-nav
(use-package elisp-slime-nav
  :ensure elisp-slime-nav
  :init
  (progn
    (defun my-load-slime ()
      (elisp-slime-nav-mode)
      (turn-on-eldoc-mode)
    )
    (add-hook 'emacs-lisp-mode-hook 'my-load-slime)
  ))

(provide 'my-elisp-slime-nav)

