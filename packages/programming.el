(use-package display-line-numbers
  :config
  (add-hook 'prog-mode-hook 'display-line-numbers-mode))

(use-package groovy-mode)

(use-package lsp-mode
  ;; :straight (lsp-mode :host github
  ;; 		      :repo )
  :config
  (setq lsp-enable-indentation nil
	lsp-enable-on-type-formatting nil)
  :init
  (setq lsp-keymap-prefix "C-c l")
  (setq read-process-output-max (* 1024 1024))
  (setq lsp-idle-delay 0.5)
  :hook ((rust-mode . lsp-deferred)
	 (javascript-mode . lsp-deferred))
  :commands (lsp lsp-deferred))

(use-package lsp-ui
  :commands lsp-ui-mode
  :custom
  (lsp-ui-peek-always-show t)
  (lsp-ui-sideline-show-hover t)
  (lsp-ui-doc-enable nil))

(use-package lsp-ivy
  :commands lsp-ivy-workspace-symbol)
(use-package lsp-treemacs
  :commands lsp-treemacs-errors-list)

(use-package dap-mode
  :ensure
  :config
  (dap-ui-mode)
  (dap-ui-controls-mode 1)

  (require 'dap-lldb)
  (require 'dap-gdb-lldb)
  (dap-gdb-lldb-setup)
  (dap-register-debug-template
   "Rust::LLDB Run Configuration"
   (list :type "lldb"
	 :request "launch"
	 :name "LLDB::Run"
	 :gdbpath "rust-lldb"
	 :target nil
	 :cwd nil)))

(use-package flycheck)

(use-package yaml-mode
  :mode "\\.yaml\\'")

(use-package json-mode
  :mode "\\.json$")

(use-package jq-mode
  :mode "\\.jq$"
  :hook ((json-mode . (lambda () (define-key json-mode-map (kbd "C-c C-j") #'jq-interactively)))))

(use-package restclient
  :straight (restclient :type git :host github :repo "pashky/restclient.el"
			:files ("*.el"))
  :mode ("\\.rest\\'" . restclient-mode)
  :bind (:map restclient-mode-map
	      ("C-c C-f" . json-mode-beautify))
  :config
  (require 'restclient-jq))

(use-package company-restclient
  :after company
  :config
  (add-to-list 'company-backends 'company-restclient))

(defun my-typescript-formatter ()
  (when (derived-mode-p 'typescript-mode)
    (shell-command (format "npx tsfmt -r %s" buffer-file-name))))

(use-package typescript-mode
  :mode "\\.tsx?$"
  :hook ((typescript-mode . lsp-deferred)
	 (typescript-mode . (lambda ()
			      (auto-revert-mode 1)
			      (add-hook 'after-save-hook 'my-typescript-formatter)))))

(use-package git-link)

(use-package editorconfig
  :ensure t
  :config
  (editorconfig-mode 1))

(add-hook 'prog-mode-hook 'electric-pair-mode)
