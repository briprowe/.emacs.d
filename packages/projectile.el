(use-package projectile
  :demand t
  :bind-keymap (("C-x p" . projectile-command-map)
		("C-x C-p" . projectile-command-map))
  :custom
  (projectile-completion-system 'ivy)
  :config
  (projectile-mode))
