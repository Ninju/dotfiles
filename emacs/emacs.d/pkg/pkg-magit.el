(use-package magit
  :ensure t
  :demand t
  :bind
  ("C-x g" . magit-status)
  :general
  (:states 'normal
	   ", g" 'magit-status)
  )

(provide 'pkg-magit)
