(use-package python
  :ensure company-jedi
  :ensure importmagic
  :ensure py-yapf
  :diminish importmagic-mode
  :after company
  :init
  ;; Add jedi backend to company
  (add-to-list 'company-backends 'company-jedi)
  ;; Setup import magic
  (add-hook 'python-mode-hook 'importmagic-mode)
  ;; Auto formatting with yapf
  (add-hook 'python-mode-hook 'py-yapf-enable-on-save))
