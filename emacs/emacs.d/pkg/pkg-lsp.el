(use-package lsp-mode
  :ensure t
  :commands lsp
  :hook
  (elixir-mode . lsp)
  (ruby-mode . lsp)
  :custom
  (lsp-auto-guess-root t)
  :init
  (add-to-list 'exec-path "~/src/downloads/elixir-ls")
  :config
  (evil-define-key 'normal lsp-mode-map ",," 'lsp-find-definition)
  (evil-define-key 'normal lsp-mode-map ",." 'pop-tag-mark)
  )

(use-package lsp-ui
  :ensure t
  :commands lsp-ui-mode
  :after lsp-mode
  )

(use-package company-lsp
  :ensure t
  :commands company-lsp
  :after lsp-mode
  )

(provide 'pkg-lsp)