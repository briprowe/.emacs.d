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

(use-package all-the-icons-ivy-rich
  :demand t
  :after (ivy-rich dash)
  :config
  (defun ivy-rich-file-size (candidate)
    (let ((candidate (expand-file-name candidate ivy--directory)))
      (if (or (not (file-exists-p candidate)) (file-remote-p candidate))
        "?"
        (let ((size (file-attribute-size (file-attributes candidate))))
          (cond
            ((> size 1000000) (format "%.1fM " (/ size 1000000.0)))
            ((> size 1000) (format "%.1fk " (/ size 1000.0)))
            (t (format "%d " size)))))))
  (defun ivy-rich-file-modes (candidate)
    (let ((candidate (expand-file-name candidate ivy--directory)))
      (if (or (not (file-exists-p candidate)) (file-remote-p candidate))
        "?"
        (format "%s" (file-attribute-modes (file-attributes candidate))))))
  (defun ivy-rich-file-user (candidate)
    (let ((candidate (expand-file-name candidate ivy--directory)))
      (if (or (not (file-exists-p candidate)) (file-remote-p candidate))
        "?"
        (let* ((user-id (file-attribute-user-id (file-attributes candidate)))
                (user-name (user-login-name user-id)))
          (format "%s" user-name)))))
  (defun ivy-rich-file-group (candidate)
    (let ((candidate (expand-file-name candidate ivy--directory)))
      (if (or (not (file-exists-p candidate)) (file-remote-p candidate))
        "?"
        (let* ((group-id (file-attribute-group-id (file-attributes candidate)))
                (group-function #'group-name)
                (group-name (funcall group-function group-id)))
          (format "%s" group-name)))))
  (defun modify-all-the-icons-ivy-rich-display-transformers-list (key value)
    (setcar
      (nthcdr
        (+ (-elem-index key all-the-icons-ivy-rich-display-transformers-list) 1)
        all-the-icons-ivy-rich-display-transformers-list)
      value))
  (modify-all-the-icons-ivy-rich-display-transformers-list
    'counsel-find-file
    '(:columns
       ((all-the-icons-ivy-rich-file-icon)
         (ivy-read-file-transformer (:width 60))
         (ivy-rich-file-user (:width 10 :face font-lock-doc-face))
         (ivy-rich-file-group (:width 10 :face font-lock-doc-face))
         (ivy-rich-file-modes (:width 11 :face font-lock-doc-face))
         (ivy-rich-file-size (:width 10 :face font-lock-doc-face))
         (ivy-rich-file-last-modified-time (:width 30 :face font-lock-doc-face)))
       :delimiter "\t"))
  (modify-all-the-icons-ivy-rich-display-transformers-list
    'ivy-switch-buffer
    '(:columns
       ((all-the-icons-ivy-rich-buffer-icon)
         (ivy-rich-candidate (:width 30))
         (ivy-rich-switch-buffer-size (:width 7))
         (ivy-rich-switch-buffer-indicators (:width 4 :face error :align right))
         (ivy-rich-switch-buffer-major-mode (:width 20 :face warning))
         (ivy-rich-switch-buffer-project (:width 15 :face success))
         (ivy-rich-switch-buffer-path (:width (lambda (x) (ivy-rich-switch-buffer-shorten-path x (ivy-rich-minibuffer-width 0.3))))))
       :predicate
       (lambda (cand) (get-buffer cand))
       :delimiter "\t"))
  (modify-all-the-icons-ivy-rich-display-transformers-list
    'ivy-switch-buffer-other-window
    '(:columns
       ((all-the-icons-ivy-rich-buffer-icon)
         (ivy-rich-candidate (:width 30))
         (ivy-rich-switch-buffer-size (:width 7))
         (ivy-rich-switch-buffer-indicators (:width 4 :face error :align right))
         (ivy-rich-switch-buffer-major-mode (:width 20 :face warning))
         (ivy-rich-switch-buffer-project (:width 15 :face success))
         (ivy-rich-switch-buffer-path (:width (lambda (x) (ivy-rich-switch-buffer-shorten-path x (ivy-rich-minibuffer-width 0.3))))))
       :predicate
       (lambda (cand) (get-buffer cand))
       :delimiter "\t"))
  (all-the-icons-ivy-rich-mode 1))
