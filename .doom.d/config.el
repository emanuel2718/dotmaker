;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;;; created by Emanuel Ramirez Alsina on 01/15/2020


;;;;;;;;;; DEFAULTS BEG ;;;;;;;;;;
(setq user-full-name "emanuel2718"
      user-mail-address "eramirez2718@gmail.com")
(setq org-directory "~/git/org/")
(setq +workspaces-on-switch-project-behavior nil) ; open new project on current window
(setq sentence-end-double-space nil)
(setq evil-shift-width 4)
(setq evil-shift-round nil)
(setq fill-column 80)
(setq whitespace-line-column 80)
(setq ranger-show-hidden t)
(setq inhibit-startup-screen t)
(setq display-line-numbers-type nil)
(setq-default tab-width 4)
(global-hl-line-mode 1)
;;;;;;;;;; DEFAULTS END ;;;;;;;;;;


;;;;;;;;;; CUSTOM KEYBINDS BEG ;;;;;;;;;;
(map! :leader
      ;; <leader><leader> show corresponding file in other window
      "SPC" #'projectile-find-other-file-other-window
      ","   #'projectile-find-other-file
      "pr"  #'projectile-replace
      "r"   #'replace-regexp
      "ii"  #'evil-numbers/inc-at-pt-incremental
      "id"  #'evil-numbers/dec-at-pt-incremental
      "lc"  #'lsp
      "ld"  #'lsp-disconnect
)

;;;;;;;;;; CUSTOM KEYBINDS END ;;;;;;;;;;


;;;;;;;;; FONTS BEG ;;;;;;;;;;

(add-to-list 'default-frame-alist
             '(font . "DejaVu Sans Mono-12"))

;;;;;;;;; FONTS END ;;;;;;;;;;

;;;;;;;;; THEMES BEG ;;;;;;;;;;

;; defualt theme
;;(setq doom-theme 'doom-gruvbox)

;; --- Naysayer beg ---
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes/")
(load-theme 'naysayer t)
;; --- Naysayer end ---


;; --- Modus beg ---
;;(set-face-background 'hl-line "#3e4446")
;;(use-package modus-themes
;;  :ensure
;;  :init
;;  (setq modus-themes-slanted-constructs t
;;        modus-themes-bold-constructs nil
;;        modus-themes-region 'no-extend)
;;
;;  (modus-themes-load-themes)
;;  :config
;;  (modus-themes-load-operandi) ;; OR (modus-themes-load-vivendi)
;;  :bind ("<f5>" . modus-themes-toggle))
;; --- Modus end ---

;;;;;;;;; THEMES END ;;;;;;;;;;


;;;;;;;;;; PACKAGES BEG ;;;;;;;;;;

;; --- Impatient Mode beg ---
;; TODO: Install impatient-mode package
;; Start webserver: M-x httpd-start
;; Start impatient: M-x impatient-mode
;; Open browser at: localhost:8080/imp
;; Tell impatient to use it: M-x imp-set-user-filter RET markdown-html RET
(defun markdown-html (buffer)
  (princ (with-current-buffer buffer
           (format "<!DOCTYPE html><html><title>Impatient Markdown</title><xmp theme=\"united\" style=\"display:none;\"> %s  </xmp><script src=\"http://strapdownjs.com/v/0.2/strapdown.js\"></script></html>" (buffer-substring-no-properties (point-min) (point-max))))
         (current-buffer)))
;; --- Impatient Mode end ---

;; --- Projectile beg ---
(setq projectile-project-search-path '("~/git/"))
;; --- Projectile end ---


;; --- Company beg ---
(use-package company
  :ensure t
  :init
  (add-hook 'after-init-hook 'global-company-mode)
  :config
  (setq company-tooltip-align-annotations t
        company-minimum-prefix-length 2
        company-idle-delay 0.1))

(define-key evil-insert-state-map (kbd "C-l") #'company-complete)
(global-set-key (kbd "C-;") 'recenter-top-bottom)
(with-eval-after-load 'company
  (define-key company-active-map (kbd "M-n") nil)
  (define-key company-active-map (kbd "M-p") nil)
  (define-key company-active-map (kbd "C-j") #'company-select-next)
  (define-key company-active-map (kbd "C-k") #'company-select-previous)
  (define-key company-active-map (kbd "C-l") #'company-complete))
;; --- Company end ---

;; --- Dashboard beg ---
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
;; --- Dashboard end ---

;; --- Modeline Format beg ---
(defun simple-mode-line-render (left right)
  (let* ((available-width (- (window-width) (length left) 2)))
    (format (format " %%s %%%ds " available-width) left right)))

(setq-default mode-line-format
              '((:eval (simple-mode-line-render
                        ;; left
                        (format-mode-line "%b [%*]")
                        ;; right
                        (format-mode-line "[%m] Row: %l  Col: %c ")))))
;; --- Modeline Format end ---

;;;;;;;;;; PACKAGES END ;;;;;;;;;;
