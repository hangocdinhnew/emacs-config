;;; language.el --- No summary.
;;; Commentary:
;;; Code:

(require 'eglot)
(require 'flymake)

(use-package zig-ts-mode
  :ensure t
  :vc ( :url "https://codeberg.org/meow_king/zig-ts-mode"
        :rev :newest))

(use-package rust-mode
  :ensure t)

(setq flymake-inline-diagnostics 'fancy)

(setq major-mode-remap-alist
      '((c-mode . c-ts-mode)
        (c++-mode . c++-ts-mode)
        (rust-mode . rust-ts-mode)
        ))

(with-eval-after-load 'eglot
  (add-to-list 'eglot-server-programs
               '((zig-ts-mode) . ("zls"))
               )
  (add-to-list 'eglot-server-programs
               '((c-mode c-ts-mode c++-mode c++-ts-mode objc-mode) . ("clangd" "--background-index" "--clang-tidy"))
               )
  (add-to-list 'eglot-server-programs
               '((rust-ts-mode rust-mode) . ("rust-analyzer"
                                             :initializationOptions
                                             (:check (:command "clippy")))))
  )

(add-hook 'c-ts-mode-hook #'eglot-ensure)
(add-hook 'c++-ts-mode-hook #'eglot-ensure)
(add-hook 'zig-ts-mode-hook #'eglot-ensure)
(add-hook 'rust-ts-mode-hook #'eglot-ensure)

(provide 'language)
;;; language.el ends here
