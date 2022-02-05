(use-package display-line-numbers
  :config
  (add-hook 'prog-mode-hook 'display-line-numbers-mode))

(use-package groovy-mode)

(use-package lsp-mode
  :hook ((rust-mode . lsp-deferred)
	 (javascript-mode . lsp-deferred))
  :commands (lsp lsp-deferred))
(use-package lsp-ui
  :commands lsp-ui-mode)
(use-package lsp-ivy
  :commands lsp-ivy-workspace-symbol)

(use-package flycheck)

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
  :mode "\\.tsx?$"
  :hook ((typescript-mode . lsp-deferred)))

(add-hook 'prog-mode-hook 'electric-pair-mode)

;; Based on this blog: https://robert.kra.hn/posts/2021-02-07_rust-with-emacs/#debugging
(use-package dap-mode
  :ensure
  :config
  (dap-ui-mode)
  (dap-ui-controls-mode 1)

  (require 'dap-lldb)
  (require 'dap-gdb-lldb)
  ;; installs .extension/vscode
  (dap-gdb-lldb-setup)
  (dap-register-debug-template
   "Rust::LLDB Run Configuration"
   (list :type "lldb"
	 :request "launch"
	 :name "LLDB::Run"
	 :gdbpath "rust-lldb"
	 :target nil
	 :cwd nil)))
