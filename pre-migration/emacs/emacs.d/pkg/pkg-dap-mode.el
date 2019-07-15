(use-package dap-mode
  :ensure t
  :commands dap-mode
  :after lsp-mode
  :hook
  (ruby-mode . dap-mode)
  (python-mode . dap-mode)
  :custom
  (dap-ruby-debug-program `("node" "~/src/github.com/rubyide/vscode-ruby/out/debugger/main.js"))
  )
