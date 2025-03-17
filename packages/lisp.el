(use-package paredit
  :ensure t
  :diminish paredit-mode)

(use-package idle-highlight-mode
  :ensure t)

(use-package clojure-mode
  :vc (:url "git@github.com:clojure-emacs/clojure-mode.git"
       :rev "eabe29b076fff19db552d36d4babaa36ecf0b704")
  :after tree-sitter)

(use-package cider
  :vc (:url "git@github.com:clojure-emacs/cider.git"
       :rev "ee35c30d58bffe08dab080ec5135e23b9dfcf508")
  :bind (:map cider-mode-map
	      ("C-c M-p" . cider-pprint-eval-last-sexp)
	      :map cider-repl-mode-map
	      ("C-c M-o" . cider-repl-clear-buffer)
	      ("C-c M-l" . cider-repl-switch-to-other))
  :config
  (require 'bind-key)
  (add-hook 'cider-repl-mode-hook (lambda ()
				    (unbind-key "RET" paredit-mode-map))))

(defvar lisp-modes
  '(cider-repl-mode-hook
    clojure-mode-hook
    clojurescript-mode-hook
    clojurec-mode-hook
    emacs-lisp-mode-hook
    eval-expression-minibuffer-setup-hook
    ;; For some reason the ielm repl breaks if `init-lisp` is executed on
    ;; it.
    ;;
    ;; ielm-mode-hook
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
