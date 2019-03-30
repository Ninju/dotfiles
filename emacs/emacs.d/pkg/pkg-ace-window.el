(use-package ace-window
  :ensure t
  :after general
  :bind
  ("C-x o" . ace-select-window)
  ("C-x w s" . ace-swap-window)
  :general
  (:states 'normal
	   ", x o" 'ace-select-window
	   ", x s" 'ace-swap-window)
  )

(provide 'pkg-ace-window)
