(use-package vue
  :ensure vue-mode
  :mode ("\\.vue\\'" . vue-mode)
  :init
  (setq mmm-submode-decoration-level 0)
  ;; Helper function to format the JS in a vue component
  ;; Probably mostly broken and riddled with bugs
  (defun prettier-vue ()
  (interactive)
  (let ((original (point)))
    (goto-char 0)
    (let* ((script-start (re-search-forward "<script>" nil t))
           (start (+ script-start 1))
           (script-end (re-search-forward "</script>" nil t))
           (end (- script-end 10)))
      (prettier-js--prettify start end)
      (goto-char original)))))
