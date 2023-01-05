(use-package julia-mode
  :mode "\\.jl\\'")

(use-package julia-repl
  :after (julia-mode)
  :config
  (add-hook 'julia-mode-hook 'julia-repl-mode))
