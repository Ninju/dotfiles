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

;;- Ruby mode
;; Do not consider `_` to be a word separator
(add-hook 'ruby-mode-hook #'(lambda () (modify-syntax-entry ?_ "w")))

;; hs-minor-mode enables code folding
(add-hook 'ruby-mode-hook 'hs-minor-mode)

;; Enable auto complete using company-mode
(global-company-mode 1)
(setq company-idle-delay 0)

;; company-yasnippet is particularly useful for Xcode so comes first
;; TODO: Check for Ruby
(add-to-list
 #'company-backends
 #'(company-yasnippet company-dabbrev-code company-gtags company-etags company-keywords))

;;- hs-minor-mode (code folding)
(eval-after-load "hideshow"
  '(add-to-list 'hs-special-modes-alist
    `(ruby-mode
      ,(rx (or "def" "class" "module" "do" "{" "[")) ; Block start
      ,(rx (or "}" "]" "end"))                       ; Block end
      ,(rx (or "#" "=begin"))                        ; Comment start
      ruby-forward-sexp nil)))

(global-set-key (kbd "C-c h") 'hs-hide-block)
(global-set-key (kbd "C-c s") 'hs-show-block)

;;- Winner mode
(when (fboundp 'winner-mode)
  (winner-mode 1))

;;- Helm
(global-set-key (kbd "M-x") 'helm-M-x)

;;- Evil
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

;; TODO: package download should go into my config
;;        https://nathantypanski.com/blog/2014-08-03-a-vim-like-emacs-config.html

;; TODO: Add Ctrl-P for fuzzy find search

;;- Key binding for Objective-C, C, C++
(global-set-key (kbd "C-c a t") 'ff-find-other-file)
(objc-font-lock-global-mode 1)
