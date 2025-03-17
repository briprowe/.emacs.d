;; Customize file
(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(load custom-file)

;; Speed up the initialization reducing garbage collection runs.
(setq gc-cons-threshold (* 32 1024 1024))
(add-hook 'after-init-hook (lambda () (setq gc-cons-threshold (* 4 1024 1024))))
;; Collect the garbage when not used.
;;(add-hook 'focus-out-hook #'garbage-collect)
(add-function :after after-focus-change-function (lambda () (unless (frame-focus-state) (garbage-collect))))

(require 'package)
(add-to-list 'package-archives
             '("melpa-stable" . "https://stable.melpa.org/packages/") t)
(package-initialize)

(require 'use-package)

(setq auth-sources '("~/.authinfo"))

(defun load-config (filename)
  (load (expand-file-name filename user-emacs-directory)))
(dolist (filename '("ui.el" "mac.el"))
  (load-config filename))

;; ;; Swap ( <=> [ and ) <=> ]
;; (keyboard-translate ?\( ?\[)
;; (keyboard-translate ?\[ ?\()
;; (keyboard-translate ?\) ?\])
;; (keyboard-translate ?\] ?\))

(use-package railscasts-reloaded-theme
  :vc (:url "git@github.com:briprowe/railscasts-reloaded-theme.git")
  :init
  (load-theme 'railscasts-reloaded t))

(defvar package-config-dir (expand-file-name "packages" user-emacs-directory))
(dolist (filename (directory-files package-config-dir))
  (when (and (not (string= ".." filename))
	     (not (string= "." filename)))
    (load (expand-file-name filename package-config-dir))))

(add-hook 'before-save-hook #'delete-trailing-whitespace)

(add-to-list 'auto-save-file-name-transforms
	     '(".*" "~/.emacs.d/auto-saves/" t))
