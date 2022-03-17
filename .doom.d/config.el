;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;;; created by Emanuel Ramirez Alsina on 01/15/2020


(use-package emacs
 :config
 (setq user-full-name "Emanuel Ramirez Alsina")
 (setq user-mail-address "eramirez2718@gmail.com")
 (setq frame-title-format '("Emacs " emacs-version))
 (setq +workspaces-on-switch-project-behavior nil)
 (setq auto-window-vscroll nil)
 (setq compilation-scroll-output 'first-error)
 (setq compilation-window-height 25)
 (setq display-line-numbers-type nil)
 (setq display-line-numbers-type nil)
 (setq evil-shift-round nil)
 (setq evil-shift-width 4)
 (setq fill-column 80)
 (setq frame-resize-pixelwise t)
 (setq hscroll-margin 0)
 (setq hscroll-step 1)
 (setq inhibit-compacting-font-caches t)
 (setq inhibit-startup-screen t)
 (setq initial-scratch-message "")
 (setq max-lisp-eval-depth 10000)
 (setq max-specpdl-size 10000)
 (setq ranger-show-hidden t)
 (setq ring-bell-function nil)
 (setq scroll-preserve-screen-position t)
 (setq scroll-step 1)
 (setq scroll-step 1)
 (setq sentence-end-double-space nil)
 (setq whitespace-line-column 80)
 (setq-default tab-width 4)
 (add-to-list 'default-frame-alist '(inhibit-double-buffering . t)))


(map! :leader
      "SPC"  #'projectile-find-other-file-other-window
      ","    #'projectile-find-other-file
      "pr"   #'projectile-replace-regexp
      "ii"   #'evil-numbers/inc-at-pt-incremental
      "id"   #'evil-numbers/dec-at-pt-incremental
      "lc"   #'lsp
      "ld"   #'lsp-disconnect
      "c."   #'recompile
      "lt"   #'evil-toggle-fold)


(use-package eldoc
  :ensure nil
  :config
  (global-eldoc-mode -1)
  (setq eldoc-echo-area-use-multiline-p nil)
  (setq eldoc-idle-delay 0.4))


(use-package mwheel
  :ensure nil
  :config
  (setq mouse-wheel-scroll-amount '(7 ((shift) . 1) ((control) . nil)))
  (setq mouse-wheel-progressive-speed nil))


(use-package recentf
  :ensure nil
  :config
  (add-to-list 'recentf-exclude (format "%s/\\.emacs.d/early-init.el" (getenv "HOME")))
  (add-to-list 'recentf-exclude (format "%s/\\.emacs.d/init.el" (getenv "HOME")))
  (add-to-list 'recentf-exclude (format "%s/\\.emacs.d/elpa/.*" (getenv "HOME")))
  (add-to-list 'recentf-exclude (format "%s/\\.emacs.d/workspace/.*" (getenv "HOME")))
  (add-to-list 'recentf-exclude (format "%s/\\.local/lib/python3.9/site-packages/.*" (getenv "HOME")))
  (add-to-list 'recentf-exclude "/usr/lib/.*")
  (recentf-mode +1))

(use-package doom-themes
  :preface (add-to-list 'custom-theme-load-path "~/.emacs.d/themes/")

  :config
  (load-theme 'naysayer t))
  (setq doom-font (font-spec :family "Ubuntu Mono" :size 18))

  ;; Windows font
  ;;(setq doom-font (font-spec :family "JetBrains Mono" :size 16 :weight: 'light)
  ;;      doom-variable-pitch-font (font-spec :family "sans" :size 14)))



(use-package company
  :ensure t
  :init
  (add-hook 'after-init-hook 'global-company-mode)
  :config
  (setq company-tooltip-align-annotations t)
  (setq company-minimum-prefix-length 2)
  (setq company-idle-delay 0.1)
  (global-set-key (kbd "C-;") 'recenter-top-bottom)
  (define-key evil-insert-state-map (kbd "C-l") #'company-complete)
  (with-eval-after-load 'company
    (define-key company-active-map (kbd "M-n") nil)
    (define-key company-active-map (kbd "M-p") nil)
    (define-key company-active-map (kbd "C-j") #'company-select-next)
    (define-key company-active-map (kbd "C-k") #'company-select-previous)
    (define-key company-active-map (kbd "C-l") #'company-complete)))

(use-package ranger
  :config
  (setq ranger-width-preview 0.5)
  (setq ranger-width-parents 0.125)
  (setq ranger-cleanup-eagerly t)
  (setq ranger-show-hidden t)
  (define-key ranger-mode-map (kbd "i") #'dired-toggle-read-only)
  (define-key ranger-mode-map (kbd "C-h") nil))

(use-package dashboard
  :init
  (add-hook 'after-init-hook 'dashboard-refresh-buffer)
  :config
  (setq dashboard-startup-banner 'official
        dashboard-banner-logo-title "Welcome to Emacs"
        dashboard-center-content t
        dashboard-show-shortcuts nil
        dashboard-items '((recents  . 10)
                          (projects  . 10))
        dashboard-projects-switch-function 'projectile-persp-switch-project)
  (dashboard-setup-startup-hook))

(use-package all-the-icons
  :if (display-graphic-p)
  :config
  (setq all-the-icons-scale-factor 0.8))



(use-package yasnippet
  :ensure t
  :hook ((lsp-mode . yas-minor-mode)))


(use-package rustic
  :ensure
  :bind (:map rustic-mode-map
              ("M-j" . lsp-ui-imenu)
              ("M-?" . lsp-find-references)
              ("C-c C-c l" . flycheck-list-errors)
              ("C-c C-c a" . lsp-execute-code-action)
              ("C-c C-c r" . lsp-rename)
              ("C-c C-c q" . lsp-workspace-restart)
              ("C-c C-c Q" . lsp-workspace-shutdown)
              ("C-c C-c s" . lsp-rust-analyzer-status))
  :config

  ;; comment to disable rustfmt on save
  (setq rustic-format-on-save t)
  (add-hook 'rustic-mode-hook 'rk/rustic-mode-hook))

(defun rk/rustic-mode-hook ()
  (when buffer-file-name
    (setq-local buffer-save-without-query t)))

(use-package lsp-mode
  :ensure
  :commands lsp
  :custom
  ;; what to use when checking on-save. "check" is default, I prefer clippy
  (lsp-rust-analyzer-cargo-watch-command "clippy")
  (lsp-eldoc-render-all t)
  (lsp-idle-delay 0.6)
  (lsp-rust-analyzer-server-display-inlay-hints t)

  :config
  (setq lsp-auto-guess-root t)
  (setq lsp-eldoc-enable-hover nil)
  (setq lsp-eldoc-hook nil)
  (setq lsp-eldoc-hook nil)
  (setq lsp-enable-file-watchers nil)
  (setq lsp-enable-folding nil)
  (setq lsp-enable-imenu nil)
  (setq lsp-enable-indentation nil)
  (setq lsp-enable-links nil)
  (setq lsp-enable-on-type-formatting nil)
  (setq lsp-enable-snippet nil)
  (setq lsp-enable-symbol-highlighting nil)
  (setq lsp-headerline-breadcrumb-enable nil)
  (setq lsp-idle-delay 0.5)
  (setq lsp-lens-enable nil)
  (setq lsp-log-io nil)
  (setq lsp-modeline-code-actions-enable nil)
  (setq lsp-modeline-diagnostics-enable nil)
  (setq lsp-semantic-tokens-enable nil)
  (setq lsp-signature-auto-activate nil)
  (setq lsp-signature-render-documentation nil)
  (setq lsp-ui-sideline-enable nil)
  (setq read-process-output-max (* 1024 1024)) ;; 1MB
  (add-hook 'lsp-mode-hook 'lsp-ui-mode))

(use-package lsp-ui
  :ensure
  :commands lsp-ui-mode
  :custom
  (lsp-ui-peek-always-show nil)
  (lsp-ui-sideline-show-hover nil)
  (lsp-ui-doc-enable nil))
