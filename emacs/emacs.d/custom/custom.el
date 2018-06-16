;; Comment prefix legend
;;
;;- package
;;^ built in
;;& helper shortcuts

;;& Init files
(defun open-emacsd-init-file ()
  "Open ~/.emacs.d/init.el"
  (interactive)
  (find-file "~/.emacs.d/init.el"))

(defun open-emacsd-custom-file ()
  "Open ~/.emacs.d/custom/custom.el"
  (interactive)
  (find-file "~/.emacs.d/custom/custom.el"))

;; Start config ---
;; Show column numbers in modeline
(column-number-mode)

;; Hide the tool bar
(tool-bar-mode -1)

;; Hide the menu bar
(menu-bar-mode -1)

(global-set-key (kbd "C-c e i") 'open-emacsd-init-file)
(global-set-key (kbd "C-c e e") 'open-emacsd-custom-file)

;;^ imenu key bindings
(global-set-key (kbd "C-c C-i") 'helm-imenu)

;;^ Buffer key bindings
(global-unset-key (kbd "C-x b"))

;;- Projectile
(add-hook 'projectile-global-mode '(global-set-key (kbd "C-c p f") 'helm-projectile-find-file))
(projectile-global-mode)

;;- Which-Key
(which-key-mode)

;;- Ruby mode
(add-hook 'ruby-mode-hook #'(lambda () (modify-syntax-entry ?_ "w")))

;;- Helm
(global-set-key (kbd "M-x") 'helm-M-x)