(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(backup-directory-alist '(("." . "~/.emacs-backups")))
 '(delete-old-versions t)
 '(rust-format-on-save t)
 '(safe-local-variable-values
   '((eval progn
	   (setq after-save-hook
		 (remove 'my-typescript-formatter after-save-hook)))
     (cider-lein-parameters . "with-profile +java-8 repl :headless :host localhost")
     (eval progn
	   (setq sql-server
		 (s-trim-right
		  (shell-command-to-string "minikube ip")))
	   (setq sql-port 30432))))
 '(straight-use-package-by-default t)
 '(warning-suppress-types '((comp))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
