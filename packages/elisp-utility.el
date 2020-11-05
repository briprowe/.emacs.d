(use-package dash
  :demand t)

(use-package dash-functional
  :demand t)

(use-package el-patch
  :demand t
  :config
  (eval-when-compile
    (el-patch-use-package-mode)))
