;; Hide the tool bar
;; (tool-bar-mode -1)

;; Hide the menu bar
;; (menu-bar-mode -1)

;; Highlight current line
(global-hl-line-mode +1)

;; Show column numbers in modeline
(column-number-mode)

(if (fboundp 'toggle-scroll-bar)
    (toggle-scroll-bar 0))

(when (version<= "26.0.50" emacs-version )
  (global-display-line-numbers-mode 1))

(global-set-key (kbd "C-c a d f") #'find-dired)

;; Deal with trailing whitespace
(add-hook 'after-change-major-mode-hook 'highlight-trailing-whitespaces-maybe)
(add-hook 'before-save-hook 'delete-trailing-whitespace)
