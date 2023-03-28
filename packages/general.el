(use-package emacs
  :init
  (setq completion-cycle-threshold 3)
  (setq tab-always-indent 'complete))

(use-package tree-sitter
  :ensure t
  :config
  ;; activate tree-sitter on any buffer containing code for which it has a parser available
  (global-tree-sitter-mode)
  ;; you can easily see the difference tree-sitter-hl-mode makes for python, ts or tsx
  ;; by switching on and off
  (add-hook 'tree-sitter-after-on-hook #'tree-sitter-hl-mode))

(use-package tree-sitter-langs
  :ensure t
  :after tree-sitter
  :config
  (add-to-list 'tree-sitter-major-mode-language-alist
	       '(web-mode . typescript)))

(use-package ido
  :straight nil
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
  :demand t
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
  :custom
  (counsel-describe-function-function #'helpful-callable)
  (counsel-describe-variable-function #'helpful-variable))

(use-package doom-modeline
  :demand t
  :custom
  (doom-modeline-buffer-file-name-style 'relative-from-project)
  :config
  (doom-modeline-mode))

(use-package rg
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
  (global-undo-tree-mode))

(use-package gist
  :demand t)

(use-package yasnippet
  :demand t)
