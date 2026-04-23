(use-package gruvbox-theme
  :ensure t
  :config
  (load-theme 'gruvbox-dark-medium t))

(use-package editorconfig
  :ensure t
  :config
  (editorconfig-mode 1))

(use-package vertico
  :ensure t
  :init (vertico-mode))

(use-package orderless
  :ensure t
  :custom
  (completion-styles '(orderless)))

(use-package marginalia
  :ensure t
  :init (marginalia-mode))

(use-package consult
  :ensure t
  :defer t)

(use-package embark
  :ensure t
  :defer t)

(use-package embark-consult
  :ensure t
  :after (embark consult)
  :defer t)

(use-package meow
  :ensure t
  :init
  :config
  (require 'meow)
  (meow-global-mode 1))

(use-package magit
  :ensure t
  :defer t)

(use-package projectile
  :ensure t
  :diminish projectile-mode
  :config
  (projectile-mode +1))

(use-package nerd-icons
  :ensure t)

(use-package doom-modeline
  :ensure t
  :hook (after-init . doom-modeline-mode)
  :custom
  (doom-modeline-height 25)
  (doom-modeline-icon t)
  (doom-modeline-major-mode-icon t)
  (doom-modeline-minor-modes nil)
  (doom-modeline-buffer-file-name-style 'truncate-upto-project))
