(tool-bar-mode -1)
(scroll-bar-mode -1)

(setq auto-save-file-name-transforms
      `((".*" ,(expand-file-name "~/.emacs.d/autosaves/") t)))

(setq backup-directory-alist
      `((".*" . ,(expand-file-name "~/.emacs.d/backups/"))))

(electric-pair-mode 1)
(setq-default indent-tabs-mode nil)
(setq-default tab-width 2)
(setq-default standard-indent 2)

(fset 'yes-or-no-p 'y-or-n-p)

(setq evil-want-integration t)
(setq evil-want-keybinding nil)
(setq evil-snipe-scope 'whole-buffer)

(setq display-line-numbers-type 'relative)
(global-display-line-numbers-mode t)

(set-face-attribute 'default nil :family "Hack Nerd Font Mono" :height 180 :weight 'bold)

(setq projectile-completion-system 'default)

; LSP

(setq lsp-completion-provider :capf)
(setq lsp-diagnostics-provider :flycheck)

(setq lsp-enable-folding nil
      lsp-enable-text-document-color nil)

(setq lsp-enable-on-type-formatting nil)

(setq lsp-headerline-breadcrumb-enable nil)

(setq lsp-ui-doc-enable t
      lsp-ui-doc-position 'at-point
      lsp-ui-sideline-enable t
      lsp-ui-sideline-show-diagnostics t
      lsp-ui-sideline-show-code-actions t)

(setq lsp-enable-snippet t)
(setq lsp-headerline-breadcrumb-enable t)
(setq lsp-idle-delay 0.1)

(setq lsp-log-io t)
