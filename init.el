;; Load custom configuration files
(add-to-list 'load-path "~/projects/code/lisp/configs/")

(load "my-base.el")
(load "keybindings.el")
(load "my-file-management.el")
(load "my-project-management.el")
(load "my-ui.el")
(load "my-org.el")
(load "my-platform.el")

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   '(dired-hide-details dired-hide-details-mode dired all-the-icons-dired visual-fill-column org-bullets which-key rainbow-delimiters no-littering ivy-rich ivy-prescient helpful general doom-themes doom-modeline counsel command-log-mode auto-package-update all-the-icons)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
