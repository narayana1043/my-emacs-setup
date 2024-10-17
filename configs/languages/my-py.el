(use-package python-mode
  :hook (python-mode . pyvenv-mode)
  (lsp))

(use-package pyvenv
  :config
  ;; Automatically activate the virtualenv if .venv directory exists in the project
  (defun projectile-pyvenv-activate ()
    "Activate virtualenv automatically if '.venv' directory exists in the project."
    (let ((project-root (projectile-project-root)))
      (when project-root
        (let ((venv-path (concat project-root ".venv/")))
          (when (and (file-exists-p venv-path)
                     (or (not pyvenv-virtual-env)
                         (not (string= (file-truename venv-path)
                                       (file-truename pyvenv-virtual-env)))))
            (pyvenv-activate venv-path)
            (message "Activated virtualenv: %s" venv-path))))))

  ;; Hook into projectile project switching and project opening
  (add-hook 'projectile-after-switch-project-hook 'projectile-pyvenv-activate)
  (add-hook 'find-file-hook 'projectile-pyvenv-activate))
