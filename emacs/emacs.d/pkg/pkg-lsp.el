(use-package lsp-mode
  :ensure t
  :commands lsp
  :hook
  (elixir-mode . lsp)
  ;; (ruby-mode . lsp)
  (python-mode . lsp)
  :general
  (:states 'normal
	   ", ," 'lsp-find-definition
	   ", ." 'pop-tag-mark)
  :custom
  (lsp-auto-guess-root t)
  (lsp-prefer-flymake :none)
  :init
  (add-to-list 'exec-path "~/src/downloads/elixir-ls")
  )

(use-package lsp-ui
  :ensure t
  :commands lsp-ui-mode
  :after lsp-mode
  )

(use-package company-lsp
  :ensure t
  :commands company-lsp
  :config
  (push 'company-lsp company-backends)
  )

(provide 'pkg-lsp)
