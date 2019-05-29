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

;; See http://bzg.fr/emacs-hide-mode-line.html
(defvar-local hidden-mode-line-mode nil)
(defvar-local hide-mode-line nil)

(defvar-local mode-line-format-bak mode-line-format)

(define-minor-mode hidden-mode-line-mode
  "Minor mode to hide the mode-line in the current buffer."
  :init-value nil
  :global nil
  :variable hidden-mode-line-mode
  :group 'editing-basics
  (if hidden-mode-line-mode
      (setq hide-mode-line mode-line-format-bak
	    header-line-format nil
            mode-line-format nil)
    (setq mode-line-format nil
	  header-line-format hide-mode-line
          hide-mode-line nil))
  (force-mode-line-update)
  ;; Apparently force-mode-line-update is not always enough to
  ;; redisplay the mode-line
  (redraw-display)
  (when (and (called-interactively-p 'interactive)
             hidden-mode-line-mode)
    (run-with-idle-timer
     0 nil 'message
     (concat "Hidden Mode Line Mode enabled.  "
             "Use M-x hidden-mode-line-mode to make the mode-line appear."))))

;; Activate hidden-mode-line-mode
(hidden-mode-line-mode 1)

;; If you want to hide the mode-line in all new buffers
(add-hook 'after-change-major-mode-hook 'hidden-mode-line-mode)

;; Alternatively, you can paint your mode-line in White but then
;; you'll have to manually paint it in black again
;; (custom-set-faces
;;  '(mode-line-highlight ((t nil)))
;;  '(mode-line ((t (:foreground "white" :background "white"))))
;;  '(mode-line-inactive ((t (:background "white" :foreground "white")))))
 ;; Command to toggle the display of the mode-line as a header

(defvar-local header-line-format nil)

 (defun mode-line-in-header ()
   (interactive)
   (if (not header-line-format)
       (setq header-line-format mode-line-format
             mode-line-format nil)
     (setq mode-line-format header-line-format
           header-line-format nil))
   (set-window-buffer nil (current-buffer)))

(mode-line-in-header)
(global-set-key (kbd "C-x j SPC") 'hidden-mode-line-mode)

;; A small minor mode to use a big fringe
(defvar bzg-big-fringe-mode nil)
(define-minor-mode bzg-big-fringe-mode
  "Minor mode to use big fringe in the current buffer."
  :init-value nil
  :global t
  :variable bzg-big-fringe-mode
  :group 'editing-basics
  (if (not bzg-big-fringe-mode)
      (set-fringe-style nil)
    (set-fringe-mode
     (/ (- (frame-pixel-width)
           (* 100 (frame-char-width)))
        2))))

;; Now activate this global minor mode
;; (bzg-big-fringe-mode 1)

;; To activate the fringe by default and deactivate it when windows
;; are split vertically, uncomment this:
;; (add-hook 'window-configuration-change-hook
;;           (lambda ()
;;             (if (delq nil
;;                       (let ((fw (frame-width)))
;;                         (mapcar (lambda(w) (< (window-width w) (/ fw 2)))
;;                                 (window-list))))
;;                 (bzg-big-fringe-mode 0)
;;               (bzg-big-fringe-mode 1))))

;; Use a minimal cursor
;; (setq default-cursor-type 'hbar)

;; Get rid of the indicators in the fringe
(mapcar (lambda(fb) (set-fringe-bitmap-face fb 'org-hide))
        fringe-bitmaps)
