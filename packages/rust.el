(use-package rust-mode
  :mode "\\.rs\\'"
  :after (yasnippet eglot tree-sitter)
  :hook ((rust-mode . yas-minor-mode)
	 (rust-mode . eglot-ensure))
  :config
  (setq rust-format-on-save t)
  (setq rust-format-show-buffer nil))

(use-package cargo)
