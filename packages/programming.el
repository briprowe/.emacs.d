(use-package display-line-numbers
  :config
  (add-hook 'prog-mode-hook 'display-line-numbers-mode))

(use-package groovy-mode)

(use-package eglot)

(use-package yaml-mode
  :mode "\\.yaml\\'")

(use-package restclient
  :mode "\\.rest\\'")

(use-package company-restclient
  :after company
  :config
  (add-to-list 'company-backends 'company-restclient))

(use-package json-mode
  :mode "\\.json$")

(use-package jq-mode
  :mode "\\.jq$"
  :hook ((json-mode . (lambda () (define-key json-mode-map (kbd "C-c C-j") #'jq-interactively)))))

(use-package typescript-mode
  :mode "\\.tsx?$")

(add-hook 'prog-mode-hook 'electric-pair-mode)
