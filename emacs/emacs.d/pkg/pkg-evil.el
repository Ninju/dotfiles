(use-package evil
  :ensure t
  :general
  (:states 'normal
	   "M-." 'find-tag
	   "M-*" 'pop-tag-mark

	   ", e v" 'open-emacsd-init-file
	   ", ," 'xref-find-definitions)
  :config
  (setq evil-want-C-i-jump nil)
  (evil-mode 1)

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
  )
