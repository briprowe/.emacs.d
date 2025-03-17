(use-package julia-mode
  :ensure t
  :mode "\\.jl\\'")

(use-package julia-repl
  :ensure t
  :after (julia-mode)
  :config
  (add-hook 'julia-mode-hook 'julia-repl-mode))
