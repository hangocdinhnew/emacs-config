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
