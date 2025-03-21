(use-package magit
  :ensure t
  :bind (("C-x g" . magit-status)
         :map magit-status-mode-map
         ("TAB" . magit-section-cycle)))


(use-package forge
  :ensure t
  :demand t
  :after magit)
