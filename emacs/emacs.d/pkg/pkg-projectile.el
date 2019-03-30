(use-package projectile
  :demand t
  :ensure t
  :bind
  ("C-c p s" . projectile-ag)
  ("C-c p d" . projectile-dired)
  ("C-c p l" . projectile-ibuffer)
  :general
  (:states 'normal
	   ", p s" 'projectile-ag
	   ", p d" 'projectile-dired
	   ", p l" 'projectile-ibuffer)
  :config
  (projectile-global-mode)
  )

(provide 'pkg-projectile)
