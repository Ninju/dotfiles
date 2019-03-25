(defun sidebar-toggle ()
  "Toggle both `dired-sidebar' and `ibuffer-sidebar'."
  (interactive)
  (dired-sidebar-toggle-sidebar)
  (ibuffer-sidebar-toggle-sidebar))

(defun aj-toggle-fold ()
  "Toggle fold all lines larger than indentation on current line"
  (interactive)
  (let ((col 1))
    (save-excursion
      (back-to-indentation)
      (setq col (+ 1 (current-column)))
      (set-selective-display
       (if selective-display nil (or col 1))))))

(defun highlight-trailing-whitespaces-maybe ()
  (when (derived-mode-p 'ruby-mode) (setq show-trailing-whitespace t)
	(derived-mode-p 'c-mode-common-hook) (setq show-trailing-whitespace t)))

;;& Init files
(defun open-emacsd-init-file ()
  "Open ~/.emacs.d/init.el"
  (interactive)
  (find-file "~/.emacs.d/init.el"))

(defun open-emacsd-custom-file ()
  "Open ~/.emacs.d/custom/custom.el"
  (interactive)
  (find-file "~/.emacs.d/custom/custom.el"))
