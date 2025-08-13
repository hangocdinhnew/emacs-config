(use-package rust-mode
  :ensure t
  :defer t)

(use-package lua-mode
  :ensure t
  :defer t)

(use-package cmake-mode
  :ensure t
  :defer t)

(use-package zig-mode
  :ensure t
  :defer t)

(use-package swift-mode
  :ensure t
  :defer t)

(require 'rust-mode)
(require 'lua-mode)
(require 'cmake-mode)
(require 'zig-mode)
(require 'swift-mode)

(add-to-list 'load-path "~/.emacs.rc/local/")
(require 'c3-mode)
