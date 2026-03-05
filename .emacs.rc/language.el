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

(use-package haxe-mode
  :ensure t
  :defer t)

(use-package racket-mode
  :ensure t
  :defer t)

(use-package nix-mode
  :ensure t
  :defer t)

(use-package qml-ts-mode
  :mode "\\.qml\\'"
  :config
  (add-hook 'qml-ts-mode-hook
            (lambda ()
              (setq-local electric-indent-chars
                          '(?\n ?\( ?\) ?{ ?} ?\[ ?\] ?\; ?,)))))

(require 'rust-mode)
(require 'lua-mode)
(require 'cmake-mode)
(require 'zig-mode)
(require 'swift-mode)
(require 'haxe-mode)
(require 'racket-mode)
(require 'nix-mode)

(add-to-list 'load-path "~/.emacs.rc/local/")
(require 'c3-mode)
(require 'odin-mode)

