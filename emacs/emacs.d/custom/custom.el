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

;;- Helm
(setq-default helm-split-window-default-side 'right)

(global-set-key (kbd "M-x") #'helm-M-x)
(global-set-key (kbd "C-c a s s") #'helm-swoop)
(global-set-key (kbd "C-c a s p") #'helm-multi-swoop-projectile)
(global-set-key (kbd "C-c a h f") #'helm-projectile-find-file)
(global-set-key (kbd "C-c a d f") #'find-dired)
(global-set-key (kbd "C-c a h TAB") #'helm-imenu-in-all-buffers)

(global-set-key (kbd "C-c p f") #'helm-projectile-find-file)
(global-set-key (kbd "C-c p s") #'projectile-ag)
(global-set-key (kbd "C-c p p") #'helm-projectile-switch-project)

;; Vim-like bindings
(define-key evil-normal-state-map (kbd ",ev") #'open-emacsd-init-file)
(define-key evil-normal-state-map (kbd ",,") #'xref-find-definitions)
(define-key evil-normal-state-map (kbd ",w") #'list-buffers)
(define-key evil-normal-state-map (kbd "C-p") #'helm-projectile-find-file-dwim)
(define-key evil-normal-state-map (kbd ", TAB") #'helm-imenu)
(define-key evil-normal-state-map (kbd ", q") #'helm-browse-project)

(global-set-key (kbd "C-c a g") #'ag)

;;- Meta key
;; (setq x-meta-keysym #'super
;;       x-super-keysym #'meta)

(set-face-attribute 'default nil :height 120)

;; Xclip mode
(xclip-mode 1)

(eval-after-load 'clojure-mode
  '(sayid-setup-package))

(if (fboundp 'toggle-scroll-bar)
    (toggle-scroll-bar 0))

(when (version<= "26.0.50" emacs-version )
  (global-display-line-numbers-mode 1))

(defun aj-toggle-fold ()
  "Toggle fold all lines larger than indentation on current line"
  (interactive)
  (let ((col 1))
    (save-excursion
      (back-to-indentation)
      (setq col (+ 1 (current-column)))
      (set-selective-display
       (if selective-display nil (or col 1))))))

(define-key evil-normal-state-map (kbd ",l") #'aj-toggle-fold)

(global-evil-search-highlight-persist t)
(define-key evil-normal-state-map (kbd ",/") #'evil-search-highlight-persist-remove-all)

(defun is-project (name)
  (s-suffix? (concat name "/") (projectile-project-root)))

(defun is-alpaca-ok-then-solarized-light-theme ()
  "Change to solarized light theme in buffer if it is inside Alpaca"
  (interactive)
  (cond ((is-project "alpaca") (message "ALPACA ALPACA ALPACA ALPACA ALPACA"))
        ((is-project "funding_circle_app") (message "FCA FCA FCA FCA FCA FCA FCA"))))


(global-set-key (kbd "C-c C-a") #'is-alpaca-ok-then-solarized-light-theme)
(define-key evil-normal-state-map (kbd ",a") #'is-alpaca-ok-then-solarized-light-theme)

(defun sidebar-toggle ()
  "Toggle both `dired-sidebar' and `ibuffer-sidebar'."
  (interactive)
  (dired-sidebar-toggle-sidebar)
  (ibuffer-sidebar-toggle-sidebar))

(use-package dired-sidebar
  :bind (("C-x C-n" . sidebar-toggle))
  :ensure t
  :commands (dired-sidebar-toggle-sidebar)
  :init
  (add-hook 'dired-sidebar-mode-hook
            (lambda ()
              (unless (file-remote-p default-directory)
                (auto-revert-mode))))
  :config
  (push 'toggle-window-split dired-sidebar-toggle-hidden-commands)
  (push 'rotate-windows dired-sidebar-toggle-hidden-commands)

  (setq dired-sidebar-subtree-line-prefix "__")
  (setq dired-sidebar-theme 'vscode)
  (setq dired-sidebar-use-term-integration t)
  (setq dired-sidebar-use-custom-font t))
