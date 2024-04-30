(use-package python-mode
  :mode "\\.py\\'")

(use-package flycheck-pycheckers
  :defer t
  :hook (flycheck-mode . #'(lambda () (when (= major-mode 'python-mode)
					(flycheck-pycheckers-setup)))))

(use-package poetry
  :ensure t
  :config
  (poetry-tracking-mode))
