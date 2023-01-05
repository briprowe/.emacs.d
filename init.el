;; Customize file
(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(load custom-file)

;; Speed up the initialization reducing garbage collection runs.
(setq gc-cons-threshold (* 32 1024 1024))
(add-hook 'after-init-hook (lambda () (setq gc-cons-threshold (* 4 1024 1024))))
;; Collect the garbage when not used.
(add-hook 'focus-out-hook #'garbage-collect)

(defun load-config (filename)
  (load (expand-file-name filename user-emacs-directory)))
(dolist (filename '("straight.el" "ui.el" "mac.el"))
  (load-config filename))

;; ;; Swap ( <=> [ and ) <=> ]
;; (keyboard-translate ?\( ?\[)
;; (keyboard-translate ?\[ ?\()
;; (keyboard-translate ?\) ?\])
;; (keyboard-translate ?\] ?\))

(use-package railscasts-reloaded-theme
  :init
  (load-theme 'railscasts-reloaded t))

(defvar package-config-dir (expand-file-name "packages" user-emacs-directory))
(dolist (filename (directory-files package-config-dir))
  (when (and (not (string= ".." filename)) (not (string= "." filename)))
    (load (expand-file-name filename package-config-dir))))

(add-hook 'before-save-hook #'delete-trailing-whitespace)
