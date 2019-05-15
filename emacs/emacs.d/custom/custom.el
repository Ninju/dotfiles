;; Comment prefix legend
;;
;;- package
;;^ built in
;;& helper shortcuts

;; START CORE
;; "CORE" is anything that is included in the base emacs installation and thus will not block init on a fresh install.

(global-set-key (kbd "C-c e i") 'open-emacsd-init-file)
(global-set-key (kbd "C-c e e") 'open-emacsd-custom-file)
(global-set-key (kbd "C-c e l c") 'open-lang-clojure-file)
(global-set-key (kbd "C-c e f") 'open-emacsd-machine-specific-config-file)

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

(global-set-key (kbd "C-c a g") #'ag)

(require 'evil)
(define-key evil-normal-state-map (kbd ",l") #'aj-toggle-fold)
(define-key evil-normal-state-map (kbd ",/") #'evil-search-highlight-persist-remove-all)

(global-set-key (kbd "C-x y") 'alex-copy-file-name-to-clipboard)
