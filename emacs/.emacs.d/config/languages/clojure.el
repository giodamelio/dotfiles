(use-package clojure-mode
  :ensure t)

(use-package cider
  :ensure t
  :after clojure-mode
  :after evil-leader
  :init
  (evil-leader/set-key-for-mode 'clojure-mode
    "d" 'cider-doc))
