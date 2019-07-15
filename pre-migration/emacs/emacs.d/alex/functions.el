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

(defun open-lang-clojure-file ()
  "Open ~/.emacs.d/lang/lang-clojure.el"
  (interactive)
  (find-file "~/.emacs.d/lang/lang-clojure.el"))

(defun open-emacsd-machine-specific-config-file ()
  "Open ~/.emacs.d/init.el"
  (interactive)
  (find-file "~/.emacs.d/core/core-machine-specific-ui.el"))

;; Source: https://emacsredux.com/blog/2013/03/27/copy-filename-to-the-clipboard/
(defun alex-copy-file-name-to-clipboard ()
  "Copy the current buffer file name to the clipboard."
  (interactive)
  (let ((filename (if (equal major-mode 'dired-mode)
                      default-directory
                    (buffer-file-name))))
    (when filename
      (kill-new filename)
      (message "Copied buffer file name '%s' to the clipboard." filename))))
