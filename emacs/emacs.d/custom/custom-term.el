;; Source: http://paralambda.org/2012/07/02/using-gnu-emacs-as-a-terminal-emulator/

(when (require 'term nil t) ; only if term can be loaded..
  (setq term-bind-key-alist
	(list (cons "C-c C-c" 'term-interrupt-subjob)
	      (cons "C-p" 'previous-line)
	      (cons "C-n" 'next-line)
	      (cons "M-f" 'term-send-forward-word)
	      (cons "M-b" 'term-send-backward-word)
	      (cons "C-c C-j" 'term-line-mode)
	      (cons "C-c C-k" 'term-char-mode)
	      (cons "M-DEL" 'term-send-backward-kill-word)
	      (cons "M-d" 'term-send-forward-kill-word)
	      (cons "<C-left>" 'term-send-backward-word)
	      (cons "<C-right>" 'term-send-forward-word)
	      (cons "C-r" 'term-send-reverse-search-history)
	      (cons "M-p" 'term-send-raw-meta)
	      (cons "M-y" 'term-send-raw-meta)
	      (cons "C-y" 'term-send-raw))))
;;
;;(when (require 'term nil t)
;;  (defun term-handle-ansi-terminal-messages (message)
;;    (while (string-match "\eAnSiT.+\n" message)
;;      ;; Extract the command code and the argument.
;;      (let* ((start (match-beginning 0))
;;	     (command-code (aref message (+ start 6)))
;;	     (argument
;;	      (save-match-data
;;		(substring message
;;			   (+ start 8)
;;			   (string-match "\r?\n" message
;;					 (+ start 8))))))
;;	;; Delete this command from MESSAGE.
;;	(setq message (replace-match "" t t message))
;;
;;	(cond ((= command-code ?c)
;;	       (setq term-ansi-at-dir argument))
;;	      ((= command-code ?h)
;;	       (setq term-ansi-at-host argument))
;;	      ((= command-code ?u)
;;	       (setq term-ansi-at-user argument))
;;	      ((= command-code ?e)
;;	       (save-excursion
;;		 (find-file-other-window argument)))
;;	      ((= command-code ?x)
;;	       (save-excursion
;;		 (find-file argument))))))
;;
;;    (when (and term-ansi-at-host term-ansi-at-dir term-ansi-at-user)
;;      (setq buffer-file-name
;;	    (format "%s@%s:%s" term-ansi-at-user term-ansi-at-host term-ansi-at-dir))
;;      (set-buffer-modified-p nil)
;;      (setq default-directory (if (string= term-ansi-at-host (system-name))
;;				  (concat 'string term-ansi-at-dir "/")
;;				(format "/%s@%s:%s/" term-ansi-at-user term-ansi-at-host term-ansi-at-dir))))
;;    message))
