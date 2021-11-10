(use-package rust-mode
  :ensure
  :mode "\\.rs\\'"
  :config
  (setq rust-format-on-save nil)
  ;; (setq rust-format-show-buffer nil)
  (add-hook 'rust-mode-hook #'yas-minor-mode)
  ;; (setq-local buffer-save-without-query t)
  )

(use-package cargo)

;; (use-package )
