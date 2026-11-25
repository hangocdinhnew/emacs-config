;; packages.el -- No summary
;;; Commentary:
;;; Code:

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
  (completion-styles '(orderless basic))
  (completion-category-defaults nil)
  (completion-category-overrides '((file (styles partial-completion))))
  )

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

(use-package evil
  :ensure t
  :init
  :config
  (evil-mode t))

(use-package magit
  :ensure t
  :defer t)

(use-package evil-snipe
  :ensure t
  :after evil
  :config
  (evil-snipe-mode +1)
  (evil-snipe-override-mode +1))

(use-package evil-collection
  :ensure t
  :after (evil)
  :config
  (evil-collection-init))

(use-package evil-mc
  :ensure t
  :after (evil)
  :config
  (global-evil-mc-mode 1))

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

(use-package corfu
  :ensure t
  
  :custom
  (corfu-auto t)
  (corfu-auto-delay 0.0)
  (corfu-auto-prefix 1)
  (corfu-cycle t)
  
  :init
  (global-corfu-mode)

  (corfu-history-mode)
  (corfu-mouse-mode)
  )

(use-package cape
  :ensure t
  
  :init
  (add-to-list 'completion-at-point-functions
               #'cape-dabbrev)
  (add-to-list 'completion-at-point-functions
               #'cape-file)
  )


(use-package yasnippet
  :ensure t
  
  :hook
  (prog-mode . yas-minor-mode)
  (text-mode . yas-minor-mode)
  )

(use-package flycheck
  :ensure t
  :hook (
         (after-init . global-flycheck-mode)
         (after-init . global-flycheck-annotate-mode))
  :config
  (global-flycheck-eglot-mode 1)
  )

(use-package eldoc-box
  :ensure t
  :hook (eglot-managed-mode-hook . eldoc-box-hover-mode))

(provide 'packages)
;;; packages.el ends here
