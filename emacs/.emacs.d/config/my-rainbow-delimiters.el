(use-package rainbow-delimiters
  :ensure
  :config
  (progn
    ; Use in all programming modes
    (add-hook 'prog-mode-hook 'rainbow-delimiters-mode)

    ; Custom colors
    (require 'cl-lib)

    (defvar my-paren-dual-colors
      '("hot pink" "dodger blue"))

    (cl-loop
      for index from 1 to rainbow-delimiters-max-face-count
      do
      (set-face-foreground
        (intern (format "rainbow-delimiters-depth-%d-face" index))
        (elt my-paren-dual-colors
             (if (cl-evenp index) 0 1))))
    )
)

(provide 'my-rainbow-delimiters)

