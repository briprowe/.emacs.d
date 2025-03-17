(use-package go-mode
  :ensure t
  :mode "\\.go\\'"
  :custom
  (gofmt-command "goimports")
  :hook
  (before-save . gofmt-before-save))

(use-package go-dlv
  :ensure t)
