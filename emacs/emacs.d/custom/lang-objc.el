;; company-yasnippet is particularly useful for Xcode so comes first
;; TODO: Check for Ruby
(add-to-list
 #'company-backends
 #'(company-yasnippet company-dabbrev-code company-gtags company-etags company-keywords))

;;- Key binding for Objective-C, C, C++
(global-set-key (kbd "C-c a t") 'ff-find-other-file)
(objc-font-lock-global-mode 1)

(let ((opam-share (ignore-errors (car (process-lines "opam" "config" "var" "share")))))
  (when (and opam-share (file-directory-p opam-share))
    ;; Register Merlin
    (add-to-list 'load-path (expand-file-name "emacs/site-lisp" opam-share))
    (autoload 'merlin-mode "merlin" nil t nil)
    ;; Automatically start it in OCaml buffers
    (add-hook 'tuareg-mode-hook 'merlin-mode t)
    (add-hook 'caml-mode-hook 'merlin-mode t)
    ;; Use opam switch to lookup ocamlmerlin binary
    (setq merlin-command 'opam)))
