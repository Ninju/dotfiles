(use-package python
  :ensure t
  :mode (
	 ("\\.py\\'" . python-mode)
         ("\\.wsgi$" . python-mode)
         ("Pipfile\\'" . python-mode)
	 )
  :interpreter ("python" . python-mode)
  :config
  (require 'dap-python)
  (setq python-shell-interpreter "python3")
  (setq py-python-command "python3")
  )

(use-package pipenv
  :ensure t
  :hook
  (python-mode . pipenv-mode)
  )

(provide 'lang-python)
