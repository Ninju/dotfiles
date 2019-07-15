(use-package org
  :ensure t
  :bind
  ("C-c o c" . org-capture)
  ("C-c o a" . org-agenda)
  :config
  (setq org-agenda-files  '("~/gtd/inbox.org"
			    "~/gtd/gtd.org"
			    "~/gtd/tickler.org"))

  (setq org-agenda-custom-commands
      '(("o" "At the office" tags-todo "@office"
         ((org-agenda-overriding-header "Office")))))

  (setq org-capture-templates '(("t" "Todo [inbox]" entry
				 (file+headline "~/gtd/inbox.org" "Tasks")
				 "* TODO %i%?")
				("T" "Tickler" entry
				 (file+headline "~/gtd/tickler.org" "Tickler")
				 "* %i%? \n %U")))
  )
