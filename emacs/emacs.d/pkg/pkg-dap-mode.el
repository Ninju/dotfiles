(use-package dap-mode
  :ensure t
  :commands dap-mode
  :after lsp-mode
  :custom
  (dap-ruby-debug-program `("node" "~/src/github.com/rubyide/vscode-ruby/out/debugger/main.js"))
  )
