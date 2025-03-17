(use-package python-mode
  :ensure t
  :after eglot
  :mode "\\.py\\'"
  :init
  (setf (alist-get '(python-mode python-ts-mode) eglot-server-programs nil nil #'equal)
	'("uv" "run" "pylsp")))
