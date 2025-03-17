(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(backup-directory-alist '(("." . "~/.emacs-backups")))
 '(delete-old-versions t)
 '(eglot-autoshutdown t)
 '(ignored-local-variable-values
   '((vc-default-patch-addressee . "bug-gnu-emacs@gnu.org")
     (etags-regen-ignores "test/manual/etags/")
     (etags-regen-regexp-alist
      (("c" "objc") "/[ \11]*DEFVAR_[A-Z_ \11(]+\"\\([^\"]+\\)\"/\\1/"
       "/[ \11]*DEFVAR_[A-Z_ \11(]+\"[^\"]+\",[ \11]\\([A-Za-z0-9_]+\\)/\\1/"))))
 '(package-selected-packages nil)
 '(package-vc-selected-packages
   '((apheleia :url "git@github.com:radian-software/apheleia.git")
     (shrink-path :url "git@github.com:zbelial/shrink-path.el.git")
     (doom-modeline :url "git@github.com:seagle0128/doom-modeline.git")
     (treemacs :url "git@github.com:Alexander-Miller/treemacs.git")
     (sqlformat :url "git@github.com:purcell/sqlformat.git")
     (cargo :url "git@github.com:briprowe/cargo.el.git")
     (nushell-mode :url "git@github.com:mrkkrp/nushell-mode.git")
     (git-link :url "git@github.com:sshaw/git-link.git")
     (jq-mode :url "git@github.com:ljos/jq-mode.git")
     (restclient :url "git@github.com:briprowe/restclient.el.git")
     (groovy-mode :url
		  "git@github.com:briprowe/groovy-emacs-modes.git")
     (projectile :url "git@github.com:bbatsov/projectile.git")
     (cider :url "git@github.com:clojure-emacs/cider.git")
     (asdf :url "git@github.com:tabfugnic/asdf.el.git")
     (yasnippet :url "git@github.com:joaotavora/yasnippet.git")
     (rg :url "git@github.com:dajva/rg.el.git")
     (el-patch :url "git@github.com:radian-software/el-patch.git")
     (railscasts-reloaded-theme :url
				"git@github.com:briprowe/railscasts-reloaded-theme.git")
     (nerd-icons-ivy-rich :url
			  "git@github.com:seagle0128/nerd-icons-ivy-rich.git")
     (ivy-rich :url "git@github.com:Yevgnen/ivy-rich.git")
     (nerd-icons :url
		 "git@github.com:rainstormstudio/nerd-icons.el.git")
     (clojure-mode :url
		   "git@github.com:clojure-emacs/clojure-mode.git")
     (gist :url "git@github.com:briprowe/gist.el.git")))
 '(safe-local-variable-values
   '((eval progn
	   (setq after-save-hook
		 (remove 'my-typescript-formatter after-save-hook)))
     (cider-lein-parameters
      . "with-profile +java-8 repl :headless :host localhost")
     (eval progn
	   (setq sql-server
		 (s-trim-right (shell-command-to-string "minikube ip")))
	   (setq sql-port 30432))))
 '(straight-use-package-by-default t)
 '(visible-bell t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
