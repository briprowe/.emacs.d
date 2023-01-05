(use-package magit
  :demand t
  :bind (("C-x g" . magit-status)
         :map magit-status-mode-map
         ("TAB" . magit-section-cycle))
  :config
  (add-hook 'magit-status-mode-hook
	    (lambda () (company-mode -1))))


;; (use-package forge
;;   :demand t
;;   :after magit)
