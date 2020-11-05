(use-package elpy
  :bind (:map elpy-mode-map
	      ("C-M-n" . elpy-nav-forward-block)
	      ("C-M-p" . elpy-nav-backward-block))
  :init
  (advice-add 'python-mode :before 'elpy-enable)
  (define-key elpy-mode-map (kbd "C-c C-p") nil)
  (define-key python-mode-map (kbd "C-c C-p") nil))
