(use-package elixir-mode
  :mode (("\\.ex\\'" . elixir-mode)
	 ("\\.exs\\'" . elixir-mode))
  :commands elixir-mode
  :defer t
  :ensure t
  :requires (evil exunit)
  :bind
  (:map evil-normal-state-map
	(", t b" . exunit-verify-all)
	(", t a" . exunit-verify)
	(", t k" . exunit-rerun)
	(", t t" . exunit-verify-single)
	)
  :config
  (require 'dap-elixir)
  (dap-mode)
  (dap-ui-mode)
  )

(provide 'lang-elixir)
