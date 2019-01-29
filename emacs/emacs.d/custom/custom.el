;; Comment prefix legend
;;
;;- package
;;^ built in
;;& helper shortcuts

;; START CORE
;; "CORE" is anything that is included in the base emacs installation and thus will not block init on a fresh install.

;;& Init files
(defun open-emacsd-init-file ()
  "Open ~/.emacs.d/init.el"
  (interactive)
  (find-file "~/.emacs.d/init.el"))

(defun open-emacsd-custom-file ()
  "Open ~/.emacs.d/custom/custom.el"
  (interactive)
  (find-file "~/.emacs.d/custom/custom.el"))

(defun highlight-trailing-whitespaces-maybe ()
  (when (derived-mode-p 'ruby-mode) (setq show-trailing-whitespace t)
	(derived-mode-p 'c-mode-common-hook) (setq show-trailing-whitespace t)))

;; Start config ---
;; Show column numbers in modeline
(column-number-mode)

;; Hide the tool bar
(tool-bar-mode -1)

;; Hide the menu bar
(menu-bar-mode -1)

;; Highlight current line
(global-hl-line-mode +1)

(global-set-key (kbd "C-c e i") 'open-emacsd-init-file)
(global-set-key (kbd "C-c e e") 'open-emacsd-custom-file)

;; END CORE

;; START PACKAGE INSTALL
(setq my-packages
      '(ag
	async
	company
	company-c-headers
	ecb
	epl
	evil
	exec-path-from-shell
	flycheck
	helm
	helm-core
	helm-projectile
	helm-swoop
	objc-font-lock
	pkg-info
	popup
	projectile
	s
	undo-tree
	which-key
	xclip
	yasnippet))

(setq uninstalled-packages (seq-filter (lambda (package-name) (not (package-installed-p package-name))) my-packages))

(if uninstalled-packages
    (progn
      (package-refresh-contents)

(while uninstalled-packages
  (let ((current-package (car uninstalled-packages)))
    (setq uninstalled-packages (cdr uninstalled-packages))
    (package-install current-package)))))


(unless (and (package-installed-p 'which-key) (package-installed-p 'helm) (package-installed-p 'objc-font-lock))
  (package-refresh-contents))

(unless (package-installed-p #'helm)
(package-install #'helm))

;; END PACKAGE CONFIG

;;- Evil
(setq evil-want-C-i-jump nil)
(require 'evil)
(evil-mode 1)

;; Deal with trailing whitespace
(add-hook 'after-change-major-mode-hook 'highlight-trailing-whitespaces-maybe)
(add-hook 'before-save-hook 'delete-trailing-whitespace)

;;^ imenu key bindings
(global-set-key (kbd "C-c C-i") 'helm-imenu)

;;^ Buffer key bindings
(defalias 'list-buffers 'ibuffer)

;;- Projectile
(add-hook 'projectile-global-mode '(global-set-key (kbd "C-c p f") 'helm-projectile-find-file))
(projectile-global-mode)

;;- Which-Key
(which-key-mode)

;; Enable auto complete using company-mode
(global-company-mode 1)
(setq company-idle-delay 0)

;;- Winner mode
(when (fboundp 'winner-mode)
  (winner-mode 1))

;; Reinstate Emacs Tags key bindings
(define-key evil-normal-state-map (kbd "M-.") 'find-tag)
(define-key evil-normal-state-map (kbd "M-*") 'pop-tag-mark)

;; change mode-line color by evil state
(defun switch-modeline-color-on-insert-command-mode ()
  (let* ((default-color (cons (face-background 'mode-line)
			      (face-foreground 'mode-line)))

	 (color (cond ((minibufferp) default-color)
		      ((evil-insert-state-p) '("#e80000" . "#ffffff"))
		      ((evil-emacs-state-p)  '("#444488" . "#ffffff"))
		      ((buffer-modified-p)   '("#006fa0" . "#ffffff"))
		      (t default-color))))

    (set-face-background 'mode-line (car color))
    (set-face-foreground 'mode-line (cdr color))))

;; TODO: fix modeline color switching on INSERT/COMMAND mode is not working properly
;; (add-hook 'post-command-hook 'switch-modeline-color-on-insert-command-mode)

;; TODO: Add Ctrl-P for fuzzy find search

;;- Helm
(global-set-key (kbd "M-x") #'helm-M-x)
(global-set-key (kbd "C-c a h s") #'helm-swoop)
(global-set-key (kbd "C-c a h f") #'helm-projectile-find-file-dwim)
(global-set-key (kbd "C-c a d f") #'find-dired)
(global-set-key (kbd "C-c a h TAB") #'helm-imenu-in-all-buffers)

(global-set-key (kbd "C-c p f") #'projectile-find-file)
(global-set-key (kbd "C-c p s") #'projectile-ag)
(global-set-key (kbd "C-c p p") #'projectile-switch-project)

(global-set-key (kbd "C-c a g") #'ag)

;;- Meta key
;; (setq x-meta-keysym #'super
;;       x-super-keysym #'meta)

(set-face-attribute 'default nil :height 100)

;; Xclip mode
(xclip-mode 1)
