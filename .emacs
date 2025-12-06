(cond
 ((eq system-type 'darwin)
  (setenv "PATH" (concat "/opt/homebrew/bin:/opt/homebrew/sbin:" (getenv "PATH")))
  (setq exec-path (split-string (getenv "PATH") path-separator))))

(setq custom-file "~/.emacs.custom.el")
(load "~/.emacs.rc/rc.el")
(load "~/.emacs.rc/config.el")
(load "~/.emacs.rc/language.el")
(load "~/.emacs.rc/packages.el")

(require 'use-package)

(load "~/.emacs.rc/which-key.el")
(load "~/.emacs.rc/keybindings.el")
