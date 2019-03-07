(require 'haskell-mode)
;; Generate tags after saving Haskell files
(setq haskell-tags-on-save t)
(custom-set-variables
  '(haskell-tags-on-save t))

(define-key haskell-mode-map (kbd "M-.") 'haskell-mode-goto-loc)
(define-key haskell-mode-map (kbd "C-c C-t") 'haskell-mode-show-type-at)

(require 'haskell-interactive-mode)
(require 'haskell-process)
(add-hook 'haskell-mode-hook 'interactive-haskell-mode)

(custom-set-variables
  '(haskell-process-suggest-remove-import-lines t)
  '(haskell-process-auto-import-loaded-modules t)
  '(haskell-process-log t))

(define-key haskell-mode-map (kbd "M-.") 'haskell-mode-jump-to-def-or-tag)
