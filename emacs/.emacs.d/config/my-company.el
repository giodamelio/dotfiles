(use-package company
  :ensure company
  :init
  (progn
    ; Enable company mode everywhere
    (global-company-mode)

    ; Custom colors
    (custom-set-faces
      '(company-preview
         ((t (:foreground "darkgray" :underline t))))
      '(company-preview-common
         ((t (:inherit company-preview))))
      '(company-tooltip
         ((t (:background "lightgray" :foreground "black"))))
      '(company-tooltip-selection
         ((t (:background "steelblue" :foreground "white"))))
      '(company-tooltip-common
         ((((type x)) (:inherit company-tooltip :weight bold))
          (t (:inherit company-tooltip))))
      '(company-tooltip-common-selection
         ((((type x)) (:inherit company-tooltip-selection :weight bold))
          (t (:inherit company-tooltip-selection)))))
  )
)

(provide 'my-company)

