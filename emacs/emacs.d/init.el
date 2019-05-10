
;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(setq package-archives '(("gnu" . "https://elpa.gnu.org/packages/")
                         ("melpa" . "https://melpa.org/packages/")
			 ("org" . "http://orgmode.org/elpa/")))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ag-ignore-list (quote ("**.min.js")))
 '(auth-source-save-behavior nil)
 '(custom-enabled-themes (quote (solarized-dark)))
 '(custom-safe-themes t)
 '(dap-ruby-debug-program
   (quote
    ("node" "~/src/github.com/rubyide/vscode-ruby/out/debugger/main.js")) t)
 '(ecb-options-version "2.50")
 '(haskell-process-auto-import-loaded-modules t)
 '(haskell-process-log t)
 '(haskell-process-suggest-remove-import-lines t)
 '(haskell-tags-on-save nil)
 '(lsp-auto-guess-root t)
 '(lsp-prefer-flymake :none)
 '(package-selected-packages
   (quote
    (clojure-mode ace-jump-helm-line org-agenda general magit pipenv poly-R R circleci build-status rspec-mode rainbow-delimeters rainbow-delimeters-mode ace-jump ace-jump-mode exunit dap-ui-mode dap dap-mode lsp company-mode winner-mode ace-window ibuffer-projectile dired-sidebar ibuffer-sidebar ibuffer-vc noflet color-theme-buffer-local load-theme-buffer-local smart-shift highlight-indent-guides flymake-yaml yaml-imenu yaml-mode yaml-tomato rbenv go-mode rainbow-delimiters rainbow-mode company-ghc haskell-mode helm-hoogle scion company-lsp lsp-mode lsp-ocaml lsp-ui reason-mode cider cider-eval-sexp-fu sotclojure merlin merlin-eldoc tuareg web-mode treemacs alchemist elixir-mode s popup pkg-info helm-core flycheck epl async yasnippet company-c-headers objc-font-lock xclip exec-path-from-shell ecb undo-tree company w3m which-key ag helm helm-ag helm-flx helm-fuzzier helm-fuzzy-find helm-projectile helm-swoop projectile evil)))
 '(solarized-high-contrast-mode-line nil)
 '(yas-snippet-dirs (quote ("/Users/alex/.emacs.d/snippets"))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))
(require 'use-package)


(add-to-list 'load-path "~/.emacs.d/site-lisp")

;; In order of stability and dependency
(mapc 'load (file-expand-wildcards "~/.emacs.d/site-lisp/*.el"))
(mapc 'load (file-expand-wildcards "~/.emacs.d/core/*.el"))
(mapc 'load (file-expand-wildcards "~/.emacs.d/alex/*.el"))

;; Need a better general solution for the load order dependency
(load "~/.emacs.d/pkg/pkg-general.el")
(load "~/.emacs.d/pkg/pkg-evil.el")


(mapc 'load (file-expand-wildcards "~/.emacs.d/pkg/*.el"))
(mapc 'load (file-expand-wildcards "~/.emacs.d/lang/*.el"))
(mapc 'load (file-expand-wildcards "~/.emacs.d/custom/*.el"))

;; ## added by OPAM user-setup for emacs / base ## 56ab50dc8996d2bb95e7856a6eddb17b ## you can edit, but keep this line
(require 'opam-user-setup "~/.emacs.d/opam-user-setup.el")
;; ## end of OPAM user-setup addition for emacs / base ## keep this line



;; Maybe remove this.
;; (require 'highlight-symbol)
;; (global-set-key [(control f3)] 'highlight-symbol)
;; (global-set-key [f3] 'highlight-symbol-next)
;; (global-set-key [(shift f3)] 'highlight-symbol-prev)
;; (global-set-key [(meta f3)] 'highlight-symbol-query-replace)

;; Every time a window is started, make sure it get maximized
(add-to-list 'default-frame-alist '(fullscreen . maximized))

(load-theme 'solarized-dark t)
