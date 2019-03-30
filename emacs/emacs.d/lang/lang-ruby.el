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
  :general
  (:states 'normal
	   ", C-t C-t" 'rspec-verifiable-mode-keymap
	   ", C-t C-d" 'rspec-dired-mode-keymap
	   ", t k" 'rspec-verify-method
	   ", t s" 'rspec-verify-single
	   ", t d" 'rspec-toggle-example-pendingness)
  :config
  (rspec-verifiable-mode)
  )
