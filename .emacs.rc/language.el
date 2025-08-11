(use-package rust-mode
  :ensure t
  :defer t)

(use-package lua-mode
  :ensure t
  :defer t)

(require 'rust-mode)
(require 'lua-mode)

(add-to-list 'load-path "~/.emacs.rc/local/")
(require 'c3-mode)
