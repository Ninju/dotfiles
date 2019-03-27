(use-package company
  :ensure t
  :config
  (global-company-mode 1)
  (setq company-idle-delay 0)
  (setq company-backends '(company-lsp company-etags company-dabbrev-code))
  )
