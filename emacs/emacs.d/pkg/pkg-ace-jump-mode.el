(use-package ace-jump-mode
  :ensure t
  :demand t
  :after (evil)
  :config
  (define-key evil-normal-state-map (kbd "SPC") 'ace-jump-mode)
  (define-key global-map (kbd "C-c SPC") 'ace-jump-mode)
  )
