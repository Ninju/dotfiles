(setq backup-directory-alist '(("." . "~/.emacs.d/backup"))
      backup-by-copying t    ; Don't delink hardlink
      version-control t      ; Use version numbers on backups
      delete-old-versions t  ; Automatically delete excess backups
      kept-new-versions 20   ; how many of the newest versions to keep
      kept-old-versions 5    ; and how many of the old
      )

;; This is so that Emacs picks up my bash aliases, e.g. python -> python3
;; (setq shell-file-name "bash")
;; (setq shell-command-switch "-ic")
