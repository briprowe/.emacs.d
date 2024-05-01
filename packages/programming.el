(use-package corfu
  :init
  (global-corfu-mode))

(use-package dabbrev
  :bind (("M-/" . dabbrev-completion)
	 ("C-M-/" . dabbrev-expand))
  :custom
  (dabbrev-ignored-buffer-regexps '("\\.\\(?:pdf\\|jpe?g\\|png\\)\\'")))

(use-package display-line-numbers
  :config
  (add-hook 'prog-mode-hook 'display-line-numbers-mode))

(use-package apheleia
  :ensure t
  :config
  (apheleia-global-mode +1))

(use-package groovy-mode)

(use-package eglot
  :demand t
  :hook (prog-mode . eglot-ensure)
  ;; These first five bindings don't need to be here, but are a good
  ;; reminder of what they are bound to
  :bind (("M-TAB" . completion-at-point)
	 ("M-g i" . imenu)
	 ;; ("M-." . xref-find-defnitions)
	 ;; ("M-," . xref-go-back)
	 :map
	 eglot-mode-map
	 ("C-c c a" . eglot-code-actions)
	 ("C-c c o" . eglot-code-actions-organize-imports)
	 ("C-c c r" . eglot-rename)
	 ("C-c c f" . eglot-format))
  :config
  (add-to-list 'eglot-server-programs
	       '(web-mode . ("typescript-language-server" "--stdio"))))

(use-package eldoc
  :init
  (global-eldoc-mode))

(use-package yaml-mode
  :after tree-sitter
  :mode "\\.yaml\\'")

(use-package restclient
  :mode "\\.rest\\'")

(use-package json-mode
  :after tree-sitter
  :mode "\\.json$")

(use-package jq-mode
  :mode "\\.jq$"
  :hook ((json-mode . (lambda () (define-key json-mode-map (kbd "C-c C-j") #'jq-interactively)))))

(use-package web-mode
  :after tree-sitter
  :ensure t
  :mode (("\\.ts\\'" . web-mode)
	 ("\\.js\\'" . web-mode)
	 ("\\.mjs\\'" . web-mode)
	 ("\\.tsx\\'" . web-mode)
	 ("\\.jsx\\'" . web-mode))
  :config
  (setq web-mode-content-types-alist '(("jsx" . "\\.js[x]?\\'"))))

(use-package git-link
  :config (global-set-key (kbd "C-c g l") 'git-link))


(add-hook 'prog-mode-hook 'electric-pair-mode)
