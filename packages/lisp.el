(use-package paredit
  :diminish paredit-mode)

(use-package idle-highlight-mode)

(use-package clojure-mode)

(use-package org)
;; (use-package ob-clojurescript
;;   :ensure t)

(use-package cider
  :bind (:map cider-mode-map
	      ("C-c M-p" . cider-pprint-eval-last-sexp)
	      :map cider-repl-mode-map
	      ("C-c M-o" . cider-repl-clear-buffer)
	      ("C-c M-l" . cider-repl-switch-to-other))
  :config
  (require 'bind-key)
  (unbind-key "C-c C-p" cider-repl-mode-map)
  (unbind-key "C-c C-p" cider-mode-map)
  ;; (setq org-babel-clojure-backend 'cider)
  )

(defvar lisp-modes
  '(cider-repl-mode-hook
    clojure-mode-hook
    clojurescript-mode-hook
    clojurec-mode-hook
    emacs-lisp-mode-hook
    eval-expression-minibuffer-setup-hook
    ielm-mode-hook
    lisp-mode-hook
    lisp-interaction-mode-hook
    scheme-mode-hook))

(defun init-lisp ()
  (paredit-mode)
  (show-paren-mode 1)
  (set-face-attribute 'show-paren-match nil :weight 'extra-bold)
  (idle-highlight-mode t))

(dolist (hook lisp-modes)
  (add-hook hook #'init-lisp))
