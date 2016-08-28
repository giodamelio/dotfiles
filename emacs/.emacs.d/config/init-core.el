;; Setup backups
(setq
   backup-by-copying t      ; Backup by copying. Slower but safer

   backup-directory-alist   ; Save all the backups to one place
    `((".*" . ,(concat dotemacs-cache-directory "backups/")))

   delete-old-versions t    ; Keep more backups
   kept-new-versions 6
   kept-old-versions 2
   version-control t)

;; Setup auto-save
(setq
  auto-save-file-name-transforms
  `((".*" ,(concat dotemacs-cache-directory "auto-saves/") t))
  auto-save-list-file-prefix
  (concat dotemacs-cache-directory "auto-saves/saves-"))

(provide 'init-core)
