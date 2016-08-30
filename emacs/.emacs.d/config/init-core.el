(use-package core
  :init
  (setq
    cache-directory (concat user-emacs-directory ".cache/")

    ;; Setup backups
    backup-by-copying t      ; Backup by copying. Slower but safer

    backup-directory-alist   ; Save all the backups to one place
      `((".*" . ,(concat cache-directory "backups/"))

    delete-old-versions t    ; Keep more backups
    kept-new-versions 6
    kept-old-versions 2
    version-control t)

    ;; Setup auto-save
    auto-save-file-name-transforms
    `((".*" ,(concat cache-directory "auto-saves/") t))
    auto-save-list-file-prefix
    (concat cache-directory "auto-saves/saves-")

    ;; Setup tabs
    indent-tabs-mode nil ; Indent with spaces
    tab-width 2 ; Indent 2 spaces

    ;; Setup recentf
    recentf-save-file (concat cache-directory "recentf")

    ;; Setup eww
    url-configuration-directory (concat cache-directory "url/")
    url-cache-directory (concat cache-directory "url/" "cache/")
    url-cookie-file (concat cache-directory "url/" "cookies/")
  ))
