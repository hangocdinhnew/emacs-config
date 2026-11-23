;;; language.el --- No summary.
;;; Commentary:
;;; Code:

(require 'eglot)
(require 'flymake)

(use-package zig-ts-mode
  :ensure t
  )

(use-package rust-mode
  :ensure t)

(use-package d-mode
  :ensure t)

(use-package nim-mode
  :ensure t)

(use-package dart-mode
  :ensure t)

(require 'jai-mode)
(with-eval-after-load 'flycheck
  (setq-default flycheck-disabled-checkers '(d-dmd)))

(setq flymake-inline-diagnostics 'fancy)

(setq major-mode-remap-alist
      '((c-mode . c-ts-mode)
        (c++-mode . c++-ts-mode)
        (rust-mode . rust-ts-mode)
        ))

(with-eval-after-load 'eglot
  (add-to-list 'eglot-server-programs
               '((nim-mode) . ("nimlangserver"))
               )
  (add-to-list 'eglot-server-programs
               '((c-mode c-ts-mode c++-mode c++-ts-mode objc-mode) . ("clangd" "--background-index" "--clang-tidy"))
               )
  (add-to-list 'eglot-server-programs
               '((rust-ts-mode rust-mode) . ("rust-analyzer"
                                             :initializationOptions
                                             (:check (:command "clippy")))))
  (add-to-list 'eglot-server-programs
               '((jai-mode) . ("jailsp")))
  )

(add-hook 'c-ts-mode-hook #'eglot-ensure)
(add-hook 'c++-ts-mode-hook #'eglot-ensure)
(add-hook 'rust-ts-mode-hook #'eglot-ensure)
(add-hook 'nim-mode-hook #'eglot-ensure)
(add-hook 'dart-mode-hook #'eglot-ensure)
(add-hook 'jai-mode-hook #'eglot-ensure)

(provide 'language)
;;; language.el ends here
