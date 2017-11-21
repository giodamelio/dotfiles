;;; packages.el --- vue layer packages file for Spacemacs.
;;
;; Copyright (c) 2012-2017 Sylvain Benner & Contributors
;;
;; Author: Gio d'Amelio <giodamelio@gmail.com>
;; URL: https://github.com/syl20bnr/spacemacs
;;
;; This file is not part of GNU Emacs.
;;
;;; License: GPLv3

;;; Commentary:

;; Simple layer for editing vue single file components

;;; Code:

(defconst vue-packages
  '(vue-mode))

(defun vue/init-vue-mode ()
  (use-package vue-mode
    :config
    ;; Make the background normal color
    (setq mmm-submode-decoration-level 0)))

;;; packages.el ends here
