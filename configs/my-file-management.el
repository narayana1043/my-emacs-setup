;;closed dired buffers are just buried
;;they need to be refresed if you go back to them
(use-package dired-single)

(use-package dired
  :ensure nil
  :custom(
	  (dired-dwin-target t)
	  (dired-auto-revert-buffer t))
  :bind (:map dired-mode-map
	      ("h" . dired-single-up-directory)
	      ("l" . dired-single-buffer)))

;; dired add icons to files
(use-package all-the-icons-dired
  :hook (dired-mode . all-the-icons-dired-mode))

;; dired hide dot files
(use-package dired-hide-dotfiles
  :hook (dired-mode . dired-hide-dotfiles-mode)
  :bind (:map dired-mode-map
	      ("H" . dired-hide-dotfiles-mode)))

;; Display a counter showing the number of the current and the other
;; matches.  Place it before the prompt, though it can be after it.
(setq isearch-lazy-count t)
(setq lazy-count-prefix-format "(%s/%s) ")
(setq lazy-count-suffix-format nil)

;; Make regular Isearch interpret the empty space as a regular
;; expression that matches any character between the words you give
;; it.
(setq search-whitespace-regexp ".*?")
