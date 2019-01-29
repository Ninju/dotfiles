
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
 '(custom-enabled-themes (quote (whiteboard)))
 '(ecb-options-version "2.50")
 '(package-selected-packages
   (quote
    (company-lsp lsp-mode lsp-ocaml lsp-ui reason-mode cider cider-eval-sexp-fu sotclojure merlin merlin-eldoc tuareg web-mode treemacs alchemist elixir-mode s popup pkg-info helm-core flycheck epl async yasnippet company-c-headers objc-font-lock xclip exec-path-from-shell ecb undo-tree company w3m which-key ag helm helm-ag helm-flx helm-fuzzier helm-fuzzy-find helm-projectile helm-swoop projectile evil)))
 '(yas-snippet-dirs (quote ("/Users/alex/.emacs.d/snippets"))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; (add-to-list 'load-path "~/.emacs.d/evil")
(add-to-list 'load-path "~/.emacs.d/site-lisp")
(add-to-list 'load-path "~/.emacs.d/custom")

;; Others wrote these
(load "dune.el")
(load "dune-flymake.el")

;; I wrote these
(load "custom.el")
(load "custom-term.el")
(load "lang-common.el")
(load "lang-ocaml.el")
(load "lang-ruby.el")
(load "lang-clojure.el")
(load "lang-objc.el")

;; ## added by OPAM user-setup for emacs / base ## 56ab50dc8996d2bb95e7856a6eddb17b ## you can edit, but keep this line
(require 'opam-user-setup "~/.emacs.d/opam-user-setup.el")
;; ## end of OPAM user-setup addition for emacs / base ## keep this line
