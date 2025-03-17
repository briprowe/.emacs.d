(use-package dash
  :ensure t
  :demand t)

(use-package el-patch
  :ensure t
  :demand t
  :config
  (eval-when-compile
    (el-patch-use-package-mode)))
