(use-package ag
  :ensure t
  :demand t
  :bind
  ("C-c a g" . ag)
  :general
  (:states 'normal
	   ", a g" 'ag)
  )

(provide 'pkg-ag)
