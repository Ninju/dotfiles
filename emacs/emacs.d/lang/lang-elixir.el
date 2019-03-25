(use-package elixir-mode
  :mode (("\\.ex\\'" . elixir-mode)
	 ("\\.exs\\'" . elixir-mode))
  :commands elixir-mode
  :defer t
  :ensure t
  :requires (evil exunit)
  :config
  (evil-define--key evil-normal-state-map 'exunit-mode-map
    ", t a" 'exunit-verify-all
    ", t v" 'exunit-verify
    ", t r" 'exunit-rerun
    ", t s" 'exunit-verify-single
    )
  ;; (evil-define-key 'normal 'exunit-mode-map (kbd ", t a") 'rspec-verifiable-mode-keymap)

  (require 'dap-elixir)
  (dap-mode)
  (dap-ui-mode)
  )

(provide 'lang-elixir)
