(which-key-mode)

(setq which-key-idle-delay 0.8    
      which-key-separator " → "   
      which-key-prefix-prefix "+")

(defvar my-leader-map (make-sparse-keymap)
  "Keymap for <leader> shortcuts.")

(define-key evil-normal-state-map (kbd "SPC") my-leader-map)
(define-key evil-visual-state-map (kbd "SPC") my-leader-map)

(define-key my-leader-map (kbd "f f") #'find-file)
(define-key my-leader-map (kbd "f d") #'dired)
(define-key my-leader-map (kbd ",") #'consult-buffer)
(define-key my-leader-map (kbd "k") #'ibuffer)

(define-key my-leader-map (kbd "e a") #'embark-act)
(define-key my-leader-map (kbd "e b") #'embark-bindings)

(define-key my-leader-map (kbd "E b") #'eval-buffer)
(define-key my-leader-map (kbd "E r") #'eval-region)
(define-key my-leader-map (kbd "E e") #'eval-expression)

(define-key my-leader-map (kbd "x") #'execute-extended-command)

(define-key my-leader-map (kbd "SPC") #'projectile-find-file)
(define-key my-leader-map (kbd "p p") #'projectile-switch-project)
(define-key my-leader-map (kbd "p b") #'projectile-switch-to-buffer)
(define-key my-leader-map (kbd "p g") #'projectile-grep)

(define-key my-leader-map (kbd "c c") #'projectile-compile-project)
(define-key my-leader-map (kbd "c r") #'recompile)

(define-key my-leader-map (kbd "g g") #'magit)

(define-key evil-normal-state-map (kbd "C-h") 'windmove-left)
(define-key evil-normal-state-map (kbd "C-j") 'windmove-down)
(define-key evil-normal-state-map (kbd "C-k") 'windmove-up)
(define-key evil-normal-state-map (kbd "C-l") 'windmove-right)

(define-key evil-visual-state-map (kbd ">") (lambda ()
  (interactive)
  (evil-shift-right (region-beginning) (region-end))
  (evil-visual-restore)))

(define-key evil-visual-state-map (kbd "<") (lambda ()
  (interactive)
  (evil-shift-left (region-beginning) (region-end))
  (evil-visual-restore)))

(global-set-key (kbd "C-x b") #'consult-buffer)

(with-eval-after-load 'dired
  (define-key dired-mode-map (kbd "C-c w") #'wdired-change-to-wdired-mode))

(which-key-add-key-based-replacements
  "SPC e" "Embark"
  "SPC f" "Files"
  "SPC E" "Eval"
  "SPC p" "Projectile"
  "SPC c" "Code"
  "SPC g" "Magit")
