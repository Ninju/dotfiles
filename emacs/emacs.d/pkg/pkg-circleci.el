(use-package build-status
  :ensure t
  :bind (
	 :map evil-normal-state-map
	      (", c o" . build-status-open)
	      )
  :after evil
  :init
  (define-key evil-normal-state-map (kbd ", c m") 'build-status-mode)
  :config
  (put 'build-status-mode-line-string 'risky-local-variable t)
  (add-to-list 'load-path "~/.emacs.d/site-lisp/circle.el")
  (autoload 'circleci "circleci" "List CircleCI builds" t)
  (autoload 'circleci-latest "circleci" "Show CircleCI build output" t)
  )
