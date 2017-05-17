(use-package clojure-mode
  :ensure t
  :ensure rainbow-delimiters
  :config
  (eldoc-mode)
  (add-hook 'clojure-mode-hook #'rainbow-delimiters-mode))

(use-package cider
  :ensure t
  :after clojure-mode
  :after evil-leader
  :config
  (evil-leader/set-key-for-mode 'clojure-mode
    "d" 'cider-doc
    "e" 'cider-eval-sexp-at-point
    "t" '(lambda ()
           (interactive)
           (cider-test-run-ns-tests)))

  ;; Make cider-refresh after saving
  (add-hook 'after-save-hook '(lambda ()
                                (when (eq major-mode 'clojure-mode)
                                  (cider-refresh)))))
