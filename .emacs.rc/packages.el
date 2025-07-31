(use-package gruvbox-theme
  :ensure t
  :config
  (load-theme 'gruvbox-dark-medium t))

(use-package vertico
  :ensure t
  :init (vertico-mode))

(use-package orderless
  :ensure t
  :custom
  (completion-styles '(orderless)))

(use-package marginalia
  :ensure t
  :init (marginalia-mode))

(use-package consult
  :ensure t
  :defer t)

(use-package embark
  :ensure t
  :defer t)

(use-package embark-consult
  :ensure t
  :after (embark consult)
  :defer t)

(use-package evil
  :ensure t
  :init
  :config
  (evil-mode t))

(use-package magit
  :ensure t
  :defer t)

(use-package evil-snipe
  :ensure t
  :after evil
  :config
  (evil-snipe-mode +1)
  (evil-snipe-override-mode +1))

(use-package evil-collection
  :ensure t
  :after (evil)
  :config
  (evil-collection-init))

(use-package projectile
  :ensure t
  :diminish projectile-mode
  :config
  (projectile-mode +1))

(use-package lsp-mode
  :ensure t
  :hook ((prog-mode . lsp-deferred))
  :commands lsp lsp-deferred)

(use-package lsp-ui
  :ensure t
  :commands lsp-ui-mode
  :after lsp-mode)

(use-package corfu
  :ensure t
  :init
  (global-corfu-mode)
  :custom
  (corfu-cycle t)
  (corfu-auto t)
  (corfu-auto-delay 0.01)
  (corfu-auto-prefix 2)
  (corfu-count 16)
  (corfu-max-width 120)
  (corfu-on-exact-match t)
  (tab-always-indent 'complete)
  :config
  (define-key corfu-map (kbd "RET") nil)
  (define-key corfu-map (kbd "<return>") nil)
  (define-key corfu-map (kbd "TAB") #'corfu-insert))

(use-package cape
  :ensure t
  :init
  (add-hook 'lsp-mode-hook #'lsp-completion-mode)
  (add-to-list 'completion-at-point-functions #'cape-dabbrev)
  (add-to-list 'completion-at-point-functions #'cape-file)
  (add-to-list 'completion-at-point-functions #'cape-history))

(use-package flycheck
  :ensure t
  :init (global-flycheck-mode))

(use-package yasnippet
  :ensure t
  :init
  (yas-global-mode 1))

(use-package yasnippet-snippets
  :ensure t)

(add-to-list 'completion-at-point-functions #'yasnippet-capf)

(use-package nerd-icons
  :ensure t)

(use-package doom-modeline
  :ensure t
  :hook (after-init . doom-modeline-mode)
  :custom
  (doom-modeline-height 25)
  (doom-modeline-icon t)
  (doom-modeline-major-mode-icon t)
  (doom-modeline-minor-modes nil)
  (doom-modeline-buffer-file-name-style 'truncate-upto-project))

;; LSP
(add-hook 'lua-ts-mode-hook #'lsp)

(with-eval-after-load 'lsp-mode
  (lsp-register-client
   (make-lsp-client
    :new-connection (lsp-stdio-connection "jdtls")
    :major-modes '(java-mode java-ts-mode jdee-mode)
    :server-id 'jdtls-server
    :multi-root t
    :notification-handlers (ht ("language/status" #'lsp-java--language-status-callback)
                              ("language/actionableNotification" #'lsp-java--actionable-notification-callback)
                              ("language/progressReport" #'lsp-java--progress-report)
                              ("workspace/notify" #'lsp-java--workspace-notify)
                              ("language/eventNotification" #'ignore))
    :request-handlers (ht ("workspace/executeClientCommand" 'lsp-java-boot--workspace-execute-client-command))
    :action-handlers (ht ("java.apply.workspaceEdit" #'lsp-java--apply-workspace-edit)
                        ("java.action.generateToStringPrompt" #'lsp-java--action-generate-to-string)
                        ("java.action.hashCodeEqualsPrompt" #'lsp-java--action-generate-equals-and-hash-code)
                        ("java.action.organizeImports" #'lsp-java--action-organize-imports)
                        ("java.action.overrideMethodsPrompt" #'lsp-java--override-methods-prompt)
                        ("java.action.generateAccessorsPrompt" #'lsp-java--generate-accessors-prompt)
                        ("java.action.generateConstructorsPrompt" #'lsp-java--generate-constructors-prompt)
                        ("java.action.applyRefactoringCommand" #'lsp-java--apply-refactoring-command)
                        ("java.action.rename" #'lsp-java--action-rename)
                        ("java.show.references" #'lsp-java--show-references)
                        ("java.show.implementations" #'lsp-java--show-implementations))
      :uri-handlers (ht ("jdt" #'lsp-java--resolve-uri))
  :initialization-options (lambda ()
                            (list :settings (lsp-configuration-section "java")
                                  :extendedClientCapabilities
                                  (list :progressReportProvider (lsp-json-bool lsp-java-progress-reports-enabled)
                                        :classFileContentsSupport t
                                        :classFileContentsSupport t
                                        :overrideMethodsPromptSupport t
                                        :hashCodeEqualsPromptSupport t
                                        :advancedOrganizeImportsSupport t
                                        :generateConstructorsPromptSupport t
                                        :generateToStringPromptSupport t
                                        :advancedGenerateAccessorsSupport t
                                        :advancedExtractRefactoringSupport t
                                        :moveRefactoringSupport t
                                        :resolveAdditionalTextEditsSupport t)
                                  :bundles (lsp-java--bundles)
                                  :workspaceFolders (->> (lsp-session)
                                                         lsp-session-server-id->folders
                                                         (gethash 'jdtls)
                                                         (-uniq)
                                                         (-map #'lsp--path-to-uri)
                                                         (apply #'vector))))
  :library-folders-fn (lambda (_workspace) (list lsp-java-workspace-cache-dir))
  :before-file-open-fn (lambda (_workspace)
                         (let ((metadata-file-name (lsp-java--get-metadata-location buffer-file-name)))
                           (setq-local lsp-buffer-uri
                                       (when (file-exists-p metadata-file-name)
                                         (with-temp-buffer (insert-file-contents metadata-file-name)
                                                           (buffer-string))))))
  :initialized-fn (lambda (workspace)
                    (with-lsp-workspace workspace
                      (lsp--set-configuration (lsp-configuration-section "java"))
                      (lsp--server-register-capability
                       (lsp-make-registration
                        :id "test-id"
                        :method "workspace/didChangeWatchedFiles"
                        :register-options? (lsp-make-did-change-watched-files-registration-options
                                            :watchers
                                            (vector (lsp-make-file-system-watcher :glob-pattern "**/*.java")
                                                    (lsp-make-file-system-watcher :glob-pattern "**/pom.xml")
                                                    (lsp-make-file-system-watcher :glob-pattern "**/*.gradle")
                                                    (lsp-make-file-system-watcher :glob-pattern "**/.project")
                                                    (lsp-make-file-system-watcher :glob-pattern "**/.classpath")
                                                    (lsp-make-file-system-watcher :glob-pattern "**/settings/*.prefs")))))))
  :completion-in-comments? t)))
