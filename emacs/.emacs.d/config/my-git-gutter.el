(use-package git-gutter
  :ensure git-gutter
  :init
  (progn
    ; Run git-gutter on any file that is in a repo
    (global-git-gutter-mode +1)

    ; Allow git-gutter to work with linenums
    (git-gutter:linum-setup)
  )
)

(provide 'my-git-gutter)

