;; projectile for project management
(use-package projectile
  :defer t
  :diminish projectile-mode
  :config (treemacs)
  :custom ((projectile-completion-system 'ivy))
  :bind-keymap ("C-c P" . projectile-command-map)
  :init
  (when (file-directory-p "~/projects/code")
    (setq projectile-project-search-path '("~/projects/code")))
  (setq projectile-switch-project-action 'projectile-dired-other-frame)) ;; Default action

(use-package counsel-projectile
  :config (counsel-projectile-mode))

(use-package forge
  :after magit)

;; Set frame title to project
(setq frame-title-format
    '(""
      "%b"
      (:eval
       (let ((project-name (projectile-project-name)))
         (unless (string= "-" project-name)
           (format " in [%s]" project-name))))))


;; treemacs configurations
(use-package treemacs
  :defer t
  :bind (("C-x t" . treemacs))
  :config
  (setq treemacs-follow-mode t))  ; Automatically follow the current file)

(use-package treemacs-projectile
  :after (treemacs projectile)
  :config
  (setq treemacs-projectile-follow-mode t))

;; Enable treemacs in all projects will below hook
(defun my/treemacs-with-projectile ()
  "Open Treemacs when switching projects in Projectile."
  (when (projectile-project-p)
    (treemacs-display-current-project-exclusively)))

(add-hook 'projectile-after-switch-project-hook 'my/treemacs-with-projectile)


;; enable perspectives
(use-package perspective
  :bind
  (("C-x C-b" . persp-list-buffers*))         ; or use a nicer switcher, see below
  :custom
  (persp-mode-prefix-key (kbd "C-x x"))  ; pick your own prefix key here
  :init
  (persp-mode))


;; Binding the Function to a Key
(global-set-key (kbd "C-c p F") 'my-projectile-open-in-new-frame)

;; Automatically save perspectives every X minutes
(use-package persp-projectile
  :after (projectile perspective)
  :bind (("C-x p p" . projectile-persp-switch-project))  ;; Use projectile with perspective
  ;; :config
  ;; (add-hook 'kill-emacs-hook #'persp-state-save)
  ;; (setq persp-state-default-file "~/.emacs.d/persp-state")
  )

(defun my-projectile-persp-in-new-frame ()
  "Switch to a project, open it in a new perspective, and a new frame."
  (interactive)
  (let ((project (projectile-completing-read "Switch to project: " (projectile-relevant-known-projects))))
    ;; Create a new frame and open project in a new perspective
    (let ((new-frame (make-frame)))
      (select-frame new-frame)
      (persp-switch project)
      (projectile-switch-project-by-name project)
      (message "Opened project %s in a new frame and perspective" project))))

  ;; Bind to a key for easy access
(global-set-key (kbd "C-c p P") 'my-projectile-persp-in-new-frame)

