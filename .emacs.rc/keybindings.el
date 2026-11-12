;;; keybindings.el --- No summary.
;;; Commentary:
;;; Code:

(define-key evil-normal-state-map (kbd "+") 'evil-mc-make-all-cursors)
(define-key evil-normal-state-map (kbd "\\") 'evil-mc-undo-all-cursors)

(define-key evil-normal-state-map (kbd "=") 'evil-mc-make-and-goto-next-match)
(define-key evil-normal-state-map (kbd "-") 'evil-mc-skip-and-goto-next-match)

(define-key evil-visual-state-map (kbd "+") 'evil-mc-make-all-cursors)
(define-key evil-visual-state-map (kbd "=") 'evil-mc-make-and-goto-next-match)

(provide 'keybindings)
;;; keybindings.el ends here
