(use-package rust-mode
  :ensure t
  :mode "\\.rs\\'"
  :after (yasnippet eglot treesitter)
  :init
  (setq rust-mode-treesitter-derive t)
  (setq rust-format-on-save t)
  :hook ((rust-mode . eglot-ensure)))

(use-package cargo
  :vc (:url "git@github.com:briprowe/cargo.el.git"))
