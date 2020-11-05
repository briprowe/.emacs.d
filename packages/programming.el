(use-package display-line-numbers
  :config
  (add-hook 'prog-mode-hook 'display-line-numbers-mode))

(use-package groovy-mode)

(use-package lsp-mode)
(use-package lsp-ui)

(use-package flycheck)

(use-package yaml-mode
  :mode "\\.yaml\\'")
