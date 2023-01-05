;; (use-package elpy
;;   :bind (:map elpy-mode-map
;; 	      ("C-M-n" . elpy-nav-forward-block)
;; 	      ("C-M-p" . elpy-nav-backward-block))
;;   :init
;;   (advice-add 'python-mode :before 'elpy-enable))


(use-package lsp-python-ms
  :ensure t
  :init (setq lsp-python-ms-auto-install-server t)
  :hook (python-mode . (lambda ()
                          (require 'lsp-python-ms)
                          (lsp))))  ; or lsp-deferred
