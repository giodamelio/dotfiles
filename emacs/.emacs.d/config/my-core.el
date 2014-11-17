; Hide toolbar
(tool-bar-mode -1)

; Break long lines at words
(visual-line-mode 1)

; Don't create lockfiles
(setq create-lockfiles nil)

; Tabs are evil(not the good evil)
(setq-default indent-tabs-mode nil)

; Show line numbers
(global-linum-mode t)

; Require trailing newline
(setq require-final-newline t)

; Hide startup messages
(setq inhibit-splash-screen t
      inhibit-startup-echo-area-message t
      inhibit-startup-message t)

; Disable vertical scrollbars
(when (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))

; CUA mode for easy {copy,cut,paste,undo}ing
(cua-mode t)

; Don't clutter the tree with autosave and backup files
(defvar my-auto-save-folder "~/.emacs.d/.saves/")
(setq backup-directory-alist `(("." . "~/.emacs.d/.saves")))
(setq auto-save-file-name-transforms
  `((".*" ,my-auto-save-folder t)))

; Keep more backups
(setq delete-old-versions t
  kept-new-versions 6
  kept-old-versions 2
  version-control t)

; Let me write `y` or `n` even for important stuff that would normally require me to fully type `yes` or `no`.
(defalias 'yes-or-no-p 'y-or-n-p)

; Enable the mouse in terminal mode
(xterm-mouse-mode 1)

; UTF-8 everywhere
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(set-selection-coding-system 'utf-8)
(prefer-coding-system 'utf-8)

; One space after sentences
(setq sentence-end-double-space nil)

; Set the font
(when window-system
  (progn
    (set-face-attribute 'default nil :font "Droid Sans Mono-10")
    (set-frame-font "Droid Sans Mono-10" nil t)
))

(provide 'my-core)

