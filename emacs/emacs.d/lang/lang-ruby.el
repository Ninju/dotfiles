(use-package rbenv
  :ensure t
  :commands rbenv-mode global-rbenv-mode
  :hook
  (ruby-mode . global-rbenv-mode)
  )

(use-package ruby-mode
  :ensure t
  :mode (("Appraisals\\'" . ruby-mode)
         ("Berksfile\\'" . ruby-mode)
         ("Brewfile\\'" . ruby-mode)
         ("Capfile\\'" . ruby-mode)
         ("Gemfile\\'" . ruby-mode)
         ("Guardfile\\'" . ruby-mode)
         ("Podfile\\'" . ruby-mode)
         ("Puppetfile\\'" . ruby-mode)
         ("Rakefile\\'" . ruby-mode)
         ("Thorfile\\'" . ruby-mode)
         ("Vagrantfile\\'" . ruby-mode)
         ("\\.builder\\'" . ruby-mode)
         ("\\.cap\\'" . ruby-mode)
         ("\\.gemspec\\'" . ruby-mode)
         ("\\.jbuilder\\'" . ruby-mode)
         ("\\.podspec\\'" . ruby-mode)
         ("\\.pryrc\\'" . ruby-mode)
         ("\\.rabl\\'" . ruby-mode)
         ("\\.rake\\'" . ruby-mode)
         ("\\.rb\\'" . ruby-mode)
         ("\\.ru\\'" . ruby-mode)
         ("\\.thor\\'" . ruby-mode))
  :interpreter ("ruby" . ruby-mode)
  :config
  ;;  (add-hook 'ruby-mode-hook #'(lambda () (modify-syntax-entry ?_ "w")))
  (require 'dap-ruby)
  )

(use-package rspec-mode
  :ensure t
  :config
  (define-key evil-normal-state-map (kbd ", t") 'rspec-verifiable-mode-keymap)
  (define-key evil-normal-state-map (kbd ", t") 'rspec-dired-mode-keymap)

  (evil-define-key 'normal 'rspec-mode (kbd ", t k") 'rspec-verify-method)
  (evil-define-key 'normal 'rspec-mode (kbd ", t s") 'rspec-verify-single)
  (evil-define-key 'normal 'rspec-mode (kbd ", t d") 'rspec-toggle-example-pendingness)
  )
