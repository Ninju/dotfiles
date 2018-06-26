
;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(setq package-archives '(("gnu" . "https://elpa.gnu.org/packages/")
                         ("melpa" . "https://melpa.org/packages/")
			 ("org" . "http://orgmode.org/elpa/")))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(company-dabbrev-downcase nil)
 '(package-selected-packages
   (quote
    (company-c-headers objc-font-lock xclip exec-path-from-shell ecb undo-tree company w3m which-key ag helm helm-ag helm-flx helm-fuzzier helm-fuzzy-find helm-projectile helm-swoop projectile evil)))
 '(split-height-threshold 999)
 '(split-width-threshold 160)
 '(yas-snippet-dirs (quote ("/Users/alex/.emacs.d/snippets"))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(add-to-list 'load-path "~/.emacs.d/evil")
(setq evil-want-C-i-jump nil)
(require 'evil)
(evil-mode 1)

(load "~/.emacs.d/custom/custom.el")
