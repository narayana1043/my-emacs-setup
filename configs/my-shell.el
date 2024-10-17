(defun my-shell-activate-venv ()
  "Activate virtual environment in shell or eshell when starting it."
  (when (bound-and-true-p pyvenv-virtual-env)
    (let ((activate-script (concat pyvenv-virtual-env "bin/activate")))
      (when (file-exists-p activate-script)
        (eshell-command (concat ". " activate-script))))))

(add-hook 'eshell-mode-hook 'my-shell-activate-venv)
;; (add-hook 'shell-mode-hook 'my-shell-activate-venv)
