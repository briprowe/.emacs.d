(use-package rust-mode
  :mode "\\.rs\\'"
  :after (yasnippet eglot tree-sitter)
  :hook (yas-minor-mode )
  :config
  (setq rust-format-on-save t)
  (setq rust-format-show-buffer nil))

(use-package cargo)
