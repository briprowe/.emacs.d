(use-package haskell-mode
  :init
  ;; (add-hook 'haskell-mode-hook #'lsp-mode)
  ;; (add-hook 'haskell-mode-hook #'lsp-ui-mode)
  (add-hook 'haskell-mode-hook #'flycheck-mode))

;; (use-package lsp-haskell
;;   :config
;;   (setq lsp-haskell-process-path-hie "ghcide")
;;   (setq lsp-haskell-process-args-hie '()))
