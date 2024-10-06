;; elisp programming mode setup
(use-package elisp-mode
  :ensure nil
  :hook (elisp-mode . lsp-deferred)
  :config
  (setq elisp-indent-level 2))

(use-package highlight-defined
  :ensure t
  :custom
  (highlight-defined-face-use-itself t)
  :hook
  (help-mode . highlight-defined-mode)
  (emacs-lisp-mode . highlight-defined-mode))

(use-package highlight-quoted
  :ensure t
  :hook
  (emacs-lisp-mode . highlight-quoted-mode))

(use-package eros
  :ensure t
  :hook
  (emacs-lisp-mode . eros-mode))

(use-package suggest
  :ensure t
  :defer t)

(use-package nameless
  :ensure t
  :hook
  (emacs-lisp-mode .  nameless-mode)
  :custom
  (nameless-global-aliases '())
  (nameless-private-prefix t))

(use-package elsa
  :defer t
  :ensure t)

(use-package flycheck-elsa
  :ensure t
  :hook
  (emacs-lisp-mode . flycheck-elsa-setup))
