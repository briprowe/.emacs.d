(use-package emacs
  :init
  (setq completion-cycle-threshold 3)
  (setq tab-always-indent 'complete)
  (global-auto-revert-mode 1))

(use-package flycheck
  :ensure t
  :config
  (add-hook 'after-init-hook #'global-flycheck-mode))

(use-package ido
  :commands (ido-completing-read
             ido-read-directory-name
             ido-read-file-name
             ido-read-buffer)
  :custom
  (ido-enable-flex-matching t)
  (ido-use-faces nil)
  :config
  ;; Show directories first.
  (defun ends-with-/ (s)
    (eq (aref s (1- (length s))) ?/))
  (defun ido-file-lessp (a b)
    (cond
     ((and (ends-with-/ a) (not (ends-with-/ b))) t)
     ((and (not (ends-with-/ a)) (ends-with-/ b)) nil)
     (t (string-lessp a b)))))

(use-package flx-ido
  :ensure t
  :after ido
  :custom
  (flx-ido-use-faces t)
  :config
  (flx-ido-mode 1)
  (defun clear-flx-highlight-face (str)
    "Clear flx-highlight-face from str"
    (remove-text-properties 0 (length str) '(face flx-highlight-face) str))
  (advice-add 'ido-complete :before (lambda ()
                                      (dolist (str ido-matches)
                                        (clear-flx-highlight-face str))
                                      (clear-flx-highlight-face ido-common-match-string)))
  ;; Remove ido-max-prospects limit from flx-ido-decorate since we can use ido-prev-match and ido-next-match.
  (defun flx-ido-decorate (things &optional clear)
    "Add ido text properties to THINGS.
If CLEAR is specified, clear them instead."
    (if flx-ido-use-faces
	(cl-loop for thing in things
		 for i from 0 below (length things)
		 collect (if clear
			     (flx-propertize thing nil)
			   (flx-propertize (car thing) (cdr thing))))
      (if clear
          things
        (mapcar #'car things)))))

(use-package smex
  :commands (smex
             smex-major-mode-commands)
  :config
  (smex-initialize))

(use-package helpful
  :bind (("C-h k" . helpful-key))
  ;; :custom
  ;; (counsel-describe-function-function #'helpful-callable)
  ;; (counsel-describe-variable-function #'helpful-variable)
  )


(use-package doom-modeline
  :ensure t
  :custom
  (doom-modeline-buffer-file-name-style 'relative-from-project)
  :hook (after-init . doom-modeline-mode))

(use-package rg
  :vc (:url "git@github.com:dajva/rg.el.git"
	    :rev "94813ba3a7ccf3af68beb23a2c39154a99e8c9ec")
  :after projectile
  :custom
  (rg-group-result t)
  (rg-command-line-flags '("--hidden"))
  :bind (:map projectile-command-map
              (("s r" . rg-project)
	       ("s r" . rg-project))
              :map rg-mode-map
              ("C-b")
              ("C-f")
              ("F" . rg-forward-history)
              ("B" . rg-back-history)))

(use-package undo-tree
  :ensure t
  :demand t
  :bind (:map undo-tree-map
	      ([remap upcase-region] . undo-tree-visualize)
              ([remap undo] . undo-tree-visualize)
              ([remap undo-only] . undo-tree-undo))
  :init
  (setq undo-tree-map (make-sparse-keymap))
  :custom
  (undo-tree-enable-undo-in-region nil)
  (undo-tree-auto-save-history nil)
  :config
  (global-undo-tree-mode 1))

(use-package igist
  :ensure t
  :bind (("M-o" . igist-dispatch)))

(use-package yasnippet
  :vc (:url "git@github.com:joaotavora/yasnippet.git"
	    :rev "5b315f1753480ebe669b157b8242448b5eafcfea")
  :ensure t)

(use-package asdf
  :vc (:url "git@github.com:tabfugnic/asdf.el.git"
	    :rev "1d95d6f81ef93135d801f49eb3f84cb96a47403a")
  :config
  (asdf-enable))
