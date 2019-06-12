
;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(setq user-init-file (or load-file-name (buffer-file-name)))
(setq user-emacs-directory (file-name-directory user-init-file))

(setq package-archives '(("gnu" . "https://elpa.gnu.org/packages/")
                         ("melpa" . "https://melpa.org/packages/")
			 ("org" . "http://orgmode.org/elpa/")))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (clj-refactor cider clojure-mode ag general use-package))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(use-package ag
  :ensure t
  :demand t
  :bind
  ("C-c a g" . ag)
  )

(use-package clojure-mode
  :ensure t
  :mode (("\\.clj\\'" . clojure-mode)
         ("\\.edn$" . clojure-mode))
  :bind
    (("C-c c j q" . cider-quit)
    ("C-c c j i" . ef-cider-jack-in)
    ("C-c c j r" . cider-restart)
    ("C-c c p a" . cljr-add-project-dependency)
    ("C-c c n a" . cljr-add-require-to-ns))
  :config
  (setq clojure--prettify-symbols-alist
	'(("fn" . ?λ)))

  (defun ef-cider-jack-in (params)
    "Quit cider if running and jack in again"
    (interactive "P")
    (if (cider-connected-p)
	(cider-quit))
    (cider-jack-in params))
)

(use-package cider
  :ensure t
  :bind
  (("C-c ," . cider-find-var)
    ("C-c ." . cider-pop-back)
    ("C-c e b" . cider-eval-buffer)
    ("C-c e f" . cider-eval-file)
    ("C-c e d" . cider-eval-defun-at-point))
  :config
  (setq cider-prompt-for-symbol nil
        cider-repl-display-help-banner nil
        cider-repl-use-pretty-printing t)

  (add-hook 'cider-mode-hook #'eldoc-mode)
  (add-hook 'cider-repl-mode-hook #'eldoc-mode)

  (defun ef-cider-run-test ()
    "Re-evaluate buffer and run test at point"
    (interactive)
    (cider-eval-buffer)
    (cider-ns-reload-all)
    (cider-test-run-test))

  (defun ef-cider-run-ns-tests ()
    "Re-evaluate buffer and run tests for namespace"
    (interactive)
    (cider-eval-buffer)
    (cider-ns-reload-all)
    (cider-test-run-ns-tests nil))
  )

(use-package clj-refactor
  :ensure t
  :after cider
  :hook
  (clojure-mode . clj-refactor-mode)
  )
