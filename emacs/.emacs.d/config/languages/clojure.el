(use-package clojure-mode
  :ensure t
  :init
  (eldoc-mode))

(use-package cider
  :ensure t
  :after clojure-mode
  :after evil-leader
  :init
  (evil-leader/set-key-for-mode 'clojure-mode
    "d" 'cider-doc))

  ;; Make cider-refresh after saving
  (add-hook 'after-save-hook '(lambda ()
                                (cider-refresh))))
