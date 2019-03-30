(use-package build-status
  :ensure t
  :demand t
  :bind
  ("C-c , c m" . build-status-mode)
  ("C-c , c o" . build-status-open)
  :general
  (:states 'normal
	   ", c m" 'build-status-mode
	   ", c o" 'build-status-open)
  :config
  (put 'build-status-mode-line-string 'risky-local-variable t)
  )

(provide 'pkg-circleci)
