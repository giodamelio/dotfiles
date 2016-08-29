(use-package web-mode
  :ensure t
  :init
  (add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))
  (setq
   ;; Setup indentation
   web-mode-markup-indent-offset 2
   web-mode-css-indent-offset 2
   web-mode-code-indent-offset 2

   ;; Disable tag auto-pairing
   web-mode-enable-auto-pairing nil

   ;; Highlight current tag and column
   web-mode-enable-current-element-highlight t
   web-mode-enable-current-column-highlight t
  ))
