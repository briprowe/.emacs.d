;;; I prefer cmd key for meta

(when (or (memq window-system '(mac ns x))
	  (daemonp))
  (load-config "exec-path-from-shell.el")
  (exec-path-from-shell-initialize))


(when (eq system-type 'darwin)
  (setq mac-option-key-is-meta nil
	mac-command-key-is-meta t
	mac-command-modifier 'meta
	mac-option-modifier 'super))
