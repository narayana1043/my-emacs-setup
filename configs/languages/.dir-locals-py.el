;; examples to activate virtualenv

((python-mode . ((pyvenv-workon . "~/venvs/gallery-dl/")
                 (subdirs . nil))))

((python-mode . ((pyvenv-activate . "~/.virtualenvs/gallery-dl/")
		 (pyvenv-post-activate-hooks . (lsp)))))
