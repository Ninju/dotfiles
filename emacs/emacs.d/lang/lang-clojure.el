(use-package clojure-mode
  :ensure t
  :mode (("\\.clj\\'" . clojure-mode)
         ("\\.edn$" . clojure-mode))
  :general
  (:states 'normal
    ", c j q" 'cider-quit
    ", c j i" 'ef-cider-jack-in)
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
  :general
  (:states 'normal
    ", ," 'cider-find-var
    ", ." 'cider-pop-back
    ", e b" 'cider-eval-buffer
    ", e f" 'cider-eval-file
    ", e d" 'cider-eval-defun-at-point)

  (:states 'normal
   :keymaps 'cider-test-report-mode-map
   "q" 'cider-popup-buffer-quit-function)

  (:states 'normal
   :keymaps 'cider-stacktrace-mode-map
   "q" 'cider-popup-buffer-quit-function)

  (:states 'normal
   :keymaps 'cider-repl-mode-map
   ", r" 'quit-window)

  (states 'visual
	  ", e r" 'cider-eval-region
	  ", r" 'cider-switch-to-repl-buffer
	  ", n s" 'cider-repl-set-ns
	  ", t t" 'ef-cider-run-ns-tests
	  ", t p" 'ef-cider-run-test)

  (:states 'visual
   :keymaps 'cider-test-report-mode-map
   "q" 'cider-popup-buffer-quit-function)

  (:states 'insert
   :keymaps 'cider-repl-mode-map
   "<up>" 'cider-repl-previous-input
   "<down>" 'cider-repl-next-input)

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

(provide 'lang-clojure)
