(use-package julia-mode
  :after tree-sitter
  :mode "\\.jl\\'")

(use-package julia-repl
  :after (julia-mode)
  :config
  (add-hook 'julia-mode-hook 'julia-repl-mode))
