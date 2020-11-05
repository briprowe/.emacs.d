(use-package company
  :demand t
  :bind (:map company-mode-map
          ("TAB" . company-indent-or-complete-common))
  :custom
  (company-tooltip-align-annotations t)
  (company-require-match nil)
  :config
  (global-company-mode 1))

(use-package company-dabbrev
  :straight company
  :after company
  :commands company-dabbrev
  :custom
  (company-dabbrev-downcase nil))

(use-package company-box
  :hook (company-mode . company-box-mode))
