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

(setq treesit-language-source-alist
      '((qml "https://github.com/yuja/tree-sitter-qmljs")))
(unless (treesit-language-available-p 'qml)
  (treesit-install-language-grammar 'qml))

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
(require 'qml-ts-mode)

