(setq treesit-language-source-alist
      '((c          . ("https://github.com/tree-sitter/tree-sitter-c"))
        (cpp        . ("https://github.com/tree-sitter/tree-sitter-cpp"))
        (rust       . ("https://github.com/tree-sitter/tree-sitter-rust"))
        (lua        . ("https://github.com/tree-sitter-grammars/tree-sitter-lua"))
        (java       . ("https://github.com/tree-sitter/tree-sitter-java"))))

(unless (treesit-language-available-p 'c)
  (treesit-install-language-grammar 'c))

(unless (treesit-language-available-p 'cpp)
  (treesit-install-language-grammar 'cpp))

(unless (treesit-language-available-p 'rust)
  (treesit-install-language-grammar 'rust))

(unless (treesit-language-available-p 'lua)
  (treesit-install-language-grammar 'lua))

(unless (treesit-language-available-p 'java)
  (treesit-install-language-grammar 'java))

(add-to-list 'auto-mode-alist '("\\.lua\\'" . lua-ts-mode))

(setq major-mode-remap-alist
      '((c-mode          . c-ts-mode)
        (c++-mode        . c++-ts-mode)
        (rust-mode       . rust-ts-mode)
        (lua-mode        . lua-ts-mode)
        (java-mode       . java-ts-mode)))
