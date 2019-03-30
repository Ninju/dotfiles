(use-package elixir-mode
  :mode (("\\.ex\\'" . elixir-mode)
	 ("\\.exs\\'" . elixir-mode))
  :commands elixir-mode
  :defer t
  :ensure t
  :requires (evil exunit)
  :general
  (:states 'normal
    ", t a" 'exunit-verify-all
    ", t v" 'exunit-verify
    ", t r" 'exunit-rerun
    ", t s" 'exunit-verify-single) ;; I need to make sure this is only in the correct minor mode
  :config
  ;; (evil-define--key evil-normal-state-map 'exunit-mode-map
  (require 'dap-elixir)
  (dap-mode)
  (dap-ui-mode)
  )

(provide 'lang-elixir)
