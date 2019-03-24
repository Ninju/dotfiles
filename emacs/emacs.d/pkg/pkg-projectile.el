(use-package helm-projectile
  :ensure t)

(use-package projectile
  :ensure t
  :requires ag
  :config
  (defun is-project (name)
    (s-suffix? (concat name "/") (projectile-project-root)))

  (add-hook 'projectile-global-mode '(global-set-key (kbd "C-c p f") 'helm-projectile-find-file))
  (projectile-global-mode)

  (global-set-key (kbd "C-c p s") #'projectile-ag)
  )
