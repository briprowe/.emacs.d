(use-package ivy
  :demand t
  ;; :bind (("<f2>" . ivy-switch-buffer)
  ;;         :map ivy-minibuffer-map
  ;;         ("RET" . ivy-alt-done)
  ;;         ("<C-return>" . ivy-immediate-done)
  ;;         ("C-s" . ignore)
  ;;         :map ivy-switch-buffer-map
  ;;         ("<f2>" . keyboard-escape-quit))
  :custom
  (ivy-magic-tilde nil)
  (ivy-extra-directories nil)
  (ivy-fixed-height-minibuffer t)
  (ivy-re-builders-alist '((t . ivy--regex-fuzzy)))
  (ivy-format-function #'ivy-format-function-line)
  :config
  (ivy-mode 1))

(use-package counsel
  :demand t
  :after ivy
  :config
  (counsel-mode 1))

(use-package ivy-rich
  :demand t
  :after ivy
  :config
  ;; Prevent highlighting helper columns
  (advice-add 'ivy-rich-format-column :around
	      (lambda (orig-fun &rest args)
                (let ((candidate (car (car (cdr args))))
                      (formatted (apply orig-fun args)))
                  (if (or
                       (eq candidate 'ivy-rich-candidate)
                       (string-suffix-p "-transformer" (symbol-name candidate)))
                      (concat (char-to-string #x200B) formatted (char-to-string #x200B))
                    formatted))))
  (advice-add 'ivy--highlight-fuzzy :around
	      (lambda (orig-fun &rest args)
                (pcase (split-string (car args) (char-to-string #x200B))
                  (`(,left ,candidate ,right) (concat left (apply orig-fun (list candidate)) right))
                  (_ (apply orig-fun args)))))
  (ivy-rich-mode 1))

(use-package nerd-icons)

(use-package nerd-icons-ivy-rich
  :ensure t
  :init
  (nerd-icons-ivy-rich-mode 1)
  (ivy-rich-mode 1))
