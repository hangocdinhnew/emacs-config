;;; language.el --- No summary.
;;; Commentary:
;;; Code:

(require 'eglot)
(require 'flymake)

(setq flymake-inline-diagnostics 'fancy)

(setq major-mode-remap-alist
      '((c-mode . c-ts-mode)
        (c++-mode . c++-ts-mode)
        ))

(add-hook 'c-ts-mode-hook #'eglot-ensure)

(provide 'language)
;;; language.el ends here
