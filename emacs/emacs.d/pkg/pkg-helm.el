(setq-default helm-split-window-default-side 'right)

(global-set-key (kbd "M-x") #'helm-M-x)
(global-set-key (kbd "C-c a s s") #'helm-swoop)
(global-set-key (kbd "C-c a s p") #'helm-multi-swoop-projectile)
(global-set-key (kbd "C-c a h f") #'helm-projectile-find-file)
(global-set-key (kbd "C-c a h TAB") #'helm-imenu-in-all-buffers)
(global-set-key (kbd "C-c p f") #'helm-projectile-find-file)
(global-set-key (kbd "C-c p p") #'helm-projectile-switch-project)
(define-key evil-normal-state-map (kbd "C-p") #'helm-projectile-find-file-dwim)
(define-key evil-normal-state-map (kbd ", TAB") #'helm-imenu)
(define-key evil-normal-state-map (kbd ", q") #'helm-browse-project)

;;^ imenu key bindings
(global-set-key (kbd "C-c C-i") 'helm-imenu)
