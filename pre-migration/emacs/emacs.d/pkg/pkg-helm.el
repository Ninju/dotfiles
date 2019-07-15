(use-package helm
  :ensure t
  :demand t
  :bind
  ;; ("M-x" . helm-M-x)
  ("C-c , i m" . helm-imenu-in-all-buffers)
  ("C-c , i i" . helm-imenu)

  ("C-c , h s" . helm-swoop)
  ("C-c , h q" . helm-browse-project)

  ("C-x b" . helm-buffers-list)
  :general
  (:states 'normal
	   ", i m" 'helm-imenu-in-all-buffers
	   ", i i" 'helm-imenu

	   ", h s" 'helm-swoop
	   ", h q" 'helm-browse-project

	   ", b l" 'helm-buffers-list
	   ", w" 'helm-buffers-list)
  :config
  (setq-default helm-split-window-default-side 'right)
  )

(use-package helm-projectile
  :after projectile
  :ensure t
  :demand t
  :bind
  ("C-c p p" . helm-projectile-switch-project)
  ("C-c p f" . helm-projectile-find-file)
  ("C-c p m" . helm-multi-swoop-projectile)
  :general
  (:states 'normal
	   ", p p" 'helm-projectile-switch-project
	   ", p f" 'helm-projectile-find-file
	   ", p m" 'helm-multi-swoop-projectile)
  )
