(use-package rust-mode
  :mode "\\.rs\\'"
  :after (yasnippet eglot treesitter)
  :init
  (setq rust-mode-treesitter-derive t)
  (setq rust-format-on-save t)
  :hook ((rust-mode . eglot-ensure)))

(use-package cargo)
