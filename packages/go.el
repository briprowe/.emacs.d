(use-package go-mode
  :mode "\\.go\\'"
  :custom
  (gofmt-command "goimports")
  :hook
  (before-save . gofmt-before-save))
