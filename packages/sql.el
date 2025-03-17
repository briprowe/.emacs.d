(use-package sqlformat
  :ensure t
  :commands (sqlformat sqlformat-buffer sqlformat-region)
  :hook (sql-mode . sqlformat-on-save-mode)
  :init
  (setq sqlformat-command 'pgformatter
	sqlformat-args '("-s2" "-g" "-u1")))
