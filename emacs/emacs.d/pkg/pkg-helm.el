(use-package helm
  :ensure t
  :bind (
	("M-x" . helm-M-x)
	("C-c a s s" . helm-swoop)
	("C-c a s p" . helm-multi-swoop-projectile)
	("C-c a h f" . helm-projectile-find-file)
	("C-c a h TAB" . helm-imenu-in-all-buffers)
	("C-c p f" . helm-projectile-find-file)
	("C-c p p" . helm-projectile-switch-project)
	("C-c C-i" . helm-imenu)

	:map evil-normal-state-map
	("C-p" . helm-projectile-find-file-dwim)
	(", TAB" . helm-imenu)
	(", q" . helm-browse-project)
	 )
  :config
  (setq-default helm-split-window-default-side 'right)
  )
