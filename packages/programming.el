(use-package corfu
  :ensure t
  :init
  (global-corfu-mode))

(use-package dabbrev
  :ensure t
  :bind (("M-/" . dabbrev-completion)
	 ("C-M-/" . dabbrev-expand))
  :custom
  (dabbrev-ignored-buffer-regexps '("\\.\\(?:pdf\\|jpe?g\\|png\\)\\'")))

(use-package display-line-numbers
  :config
  (add-hook 'prog-mode-hook 'display-line-numbers-mode))

(use-package apheleia
  :vc (:url "git@github.com:radian-software/apheleia.git"
	    :rev "v4.4")
  :config
  (apheleia-global-mode +1))

;; (use-package groovy-mode
;;   :vc (:url "git@github.com:briprowe/groovy-emacs-modes.git"))

(use-package eglot
  :ensure t
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
  :ensure t
  :mode "\\.yaml\\'")

;; (use-package restclient
;;   :vc (:url "git@github.com:briprowe/restclient.el.git")
;;   :mode "\\.rest\\'")

(use-package json-mode
  :ensure t
  :mode "\\.json$")

(use-package jq-mode
  :vc (:url "git@github.com:ljos/jq-mode.git"
	    :rev "eeb86b4d5ad823e97bd19979fcb22d0aa90ff07b")
  :mode "\\.jq$"
  :hook ((json-mode . (lambda () (define-key json-mode-map (kbd "C-c C-j") #'jq-interactively)))))

(use-package web-mode
  :ensure t
  :mode (("\\.ts\\'" . web-mode)
	 ("\\.js\\'" . web-mode)
	 ("\\.mjs\\'" . web-mode)
	 ("\\.tsx\\'" . web-mode)
	 ("\\.jsx\\'" . web-mode))
  :config
  (setq web-mode-content-types-alist '(("jsx" . "\\.js[x]?\\'"))))

(use-package git-link
  :vc (:url "git@github.com:sshaw/git-link.git"
	    :rev "8d0f98cf36f6b9c31285329b054ae77f9a3d9b33")
  :config (global-set-key (kbd "C-c g l") 'git-link))


(add-hook 'prog-mode-hook 'electric-pair-mode)

(use-package realgud
  :ensure t)

(use-package nushell-mode
  :vc (:url "git@github.com:mrkkrp/nushell-mode.git"
	    :rev "c179c3cf573b2cc9421dc08bf47e2d619c7791ee")
  :mode "\\.nu$")
