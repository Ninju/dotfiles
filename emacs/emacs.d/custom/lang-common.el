;;- Ruby mode
;; Do not consider `_` to be a word separator

;;- Elixir mode
;; Do not consider '_' to be a word separator
(add-hook 'elixir-mode-hook #'(lambda () (modify-syntax-entry ?_ "w")))
