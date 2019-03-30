(use-package ace-jump-mode
  :ensure t
  :demand t
  :after general
  :bind
  ("C-c SPC" . ace-jump-mode)
  :general
  (:states 'normal
	   "SPC" 'evil-ace-jump-char-mode)
  (:states 'visual
	   "SPC" 'evil-ace-jump-char-mode)
  )

(provide 'pkg-ace-jump-mode)
