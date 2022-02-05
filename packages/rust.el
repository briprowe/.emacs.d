(use-package rust-mode
  :mode "\\.rs\\'"
  :hook ((rust-mode . yas-minor-mode))
  :config
  (setq rust-format-on-save t)
  (setq rust-format-show-buffer nil))

(use-package cargo)

;; (use-package )
