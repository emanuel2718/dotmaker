;;; init.el --- Init file -*- lexical-binding: t -*-

;; ---------- OPTIONS ----------
(tool-bar-mode -1)
(menu-bar-mode -1)
(scroll-bar-mode -1)

;; disable startup message
(defun display-startup-echo-area-message () (message ""))


(setq-default frame-title-format "%b %& Emacs")

;; UTF-8 Everywhere
(prefer-coding-system 'utf-8)
(set-default-coding-systems 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(setq default-buffer-file-coding-system 'utf-8)

(setq use-dialog-box nil)
(defalias 'yes-or-no-p 'y-or-n-p)

;; store registers on exit
(savehist-mode 1)
(setq savehist-additional-variables '(register-alist))

;; NO file backups
(setq backup-inhibited t)
(setq auto-save-default nil)

;; keep cursor & highlight on current window
(setq cursor-in-non-selected-windows 'hollow)

;; perf improvement
(setq bidi-display-reordering nil)

;; hide mouse pointer while typing
(setq make-pointer-invisible t)

(setq sentence-end-double-space nil)

;; scrolling options
(setq scroll-margin 8)
(setq scroll-step 1)
(setq mouse-wheel-scroll-amount '(6 ((shift) . 1)))
(setq mouse-wheel-progressive-speed nil)
(setq mouse-wheel-inhibit-click-time nil)
(setq scroll-preserve-screen-position t)
(setq scroll-error-top-bottom t)
(setq next-error-recenter (quote (4)))
(setq fast-but-imprecise-scrolling nil)
(setq jit-lock-defer-time 0)


;; clipboard options
(setq mouse-yank-at-point t)
(setq select-enable-clipboard t)
(setq x-select-request-type '(UTF8_STRING COMPOUND_TEXT TEXT STRING))

;; undo options
(fset 'undo-auto-amalgamate 'ignore)
(setq undo-limit 67108864) ;; 64MB
(setq undo-strong-limit 100663296) ;; 96MB (1.5x)
(setq undo-outer-limit 1006632960) ;; 960MB (15x)


;; tabs
;; default to 2 spaces

(setq default-tab-width 2)
(setq tab-width 2)

(setq default-fill-column 100)
(setq fill-column 100)

(setq-default evil-indent-convert-tabs nil)
(setq-default indent-tabs-mode nil)
(setq-default tab-width 2)
(setq-default evil-shift-round nil)


;; ---------- PACKAGES ----------
(with-eval-after-load 'package
  (add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
  (add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/")))

(package-initialize)

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(eval-when-compile (require 'use-package))
(setq use-package-always-ensure t)
(setq use-package-always-defer t)

(use-package package-utils
  :commands (package-utils-upgrade-all-and-recompile))

(use-package hl-prog-extra
  :commands (hl-prog-extra-mode)
  :init (add-hook 'prog-mode-hook #'hl-prog-extra-mode))

(unless (package-installed-p 'projectile)
  (package-install 'projectile))

;; Evil mode
(use-package evil
  :demand t
  :init

  ;; See `undo-fu' package.
  (setq evil-undo-system 'undo-fu)
  ;; For some reasons evils own search isn't default.
  (setq evil-search-module 'evil-search)

  :config
  ;; Initialize.
  (evil-mode)

  (setq evil-ex-search-case 'sensitive))

(use-package undo-fu)

(use-package evil-surround
  :demand t
  :config
  ;; Initialize.
  (global-evil-surround-mode 1))


;; Ivy completion
(use-package ivy
  :demand t
  :config
  (ivy-mode)

  ;; Always show half the window height. Why?
  ;; .. useful when searching through large lists of content.
  (setq ivy-height-alist `((t . ,(lambda (_caller) (/ (frame-height) 2)))))

  ;; VIM style keys in ivy (holding Control).
  (define-key ivy-minibuffer-map (kbd "C-j") 'next-line)
  (define-key ivy-minibuffer-map (kbd "C-k") 'previous-line)

  (define-key ivy-minibuffer-map (kbd "C-h") 'minibuffer-keyboard-quit)
  (define-key ivy-minibuffer-map (kbd "C-l") 'ivy-done)

  ;; open and next
  (define-key ivy-minibuffer-map (kbd "C-M-j") 'ivy-next-line-and-call)
  (define-key ivy-minibuffer-map (kbd "C-M-k") 'ivy-previous-line-and-call)

  (define-key ivy-minibuffer-map (kbd "<C-return>") 'ivy-done)

  ;; so we can switch away
  (define-key ivy-minibuffer-map (kbd "C-w") 'evil-window-map))


;; Company autocomplete
(use-package company
  :commands (company-complete-common company-dabbrev)
  :config
  (global-company-mode)

  ;; Increase maximum number of items to show in auto-completion. Why?
  ;; .. seeing more at once gives you a better overview of your options.
  (setq company-tooltip-limit 40)

  ;; Don't make abbreviations lowercase or ignore case. Why?
  ;; .. many languages are case sensitive, so changing case isn't helpful.
  (setq company-dabbrev-downcase nil)
  (setq company-dabbrev-ignore-case nil)

  ;; Key-map: hold Control for VIM motion. Why?
  ;; .. we're already holding Control, allow navigation at the same time.
  (define-key company-active-map (kbd "C-j") 'company-select-next-or-abort)
  (define-key company-active-map (kbd "C-k") 'company-select-previous-or-abort)
  (define-key company-active-map (kbd "C-l") 'company-complete-selection)
  (define-key company-active-map (kbd "C-h") 'company-abort)
  (define-key company-active-map (kbd "<C-return>") 'company-complete-selection)

  (define-key company-search-map (kbd "C-j") 'company-select-next)
  (define-key company-search-map (kbd "C-k") 'company-select-previous))


;; Buffer search
(use-package swiper
  :commands (swiper)
  :config

  ;; Go to the start of the match instead of the end. Why?
  ;; .. allows us to operate on the term just jumped to (look up reference for e.g.)
  (setq swiper-goto-start-of-match t))

;; Project search
(use-package counsel
  :commands (counsel-git-grep counsel-switch-buffer))

;; Find file in project
(use-package find-file-in-project
  :commands (find-file-in-project))

(use-package highlight-numbers
  :hook ((prog-mode) . highlight-numbers-mode))


;; ---------- DISPLAY ----------
(global-display-line-numbers-mode 1)
(setq column-number-mode t)
(show-paren-mode 1)
(setq blink-matching-paren nil)
(setq show-paren-delay 0.2)
(setq show-paren-highlight-openparen t)
(setq show-paren-when-point-inside-paren t)
(setq-default truncate-lines t)


(add-hook
 'after-change-major-mode-hook
 (lambda ()
   (cond
    ((derived-mode-p 'prog-mode)
     (flyspell-prog-mode))
    ((derived-mode-p 'text-mode)
     (flyspell-mode)))))


(add-hook 'emacs-lisp-mode-hook
  (lambda ()
    (setq-local fill-column 120)
    (setq-local tab-width 2)
    (setq-local evil-shift-width 2)
    (setq-local indent-tabs-mode nil)

    (setq-local ffip-patterns '("*.el"))

    ;; Don't delimit on dashes or underscores. Why?
    ;; .. makes searching for variable names inconvenient.
    (modify-syntax-entry ?- "w")
    (modify-syntax-entry ?_ "w")))


(add-hook 'python-mode-hook
  (lambda ()
    (setq-local fill-column 100)
    (setq-local tab-width 2)
    (setq-local evil-shift-width 2)
    (setq-local indent-tabs-mode nil)

    (setq-local ffip-patterns '("*.py"))))

(add-hook 'sh-mode-hook
  (lambda ()
    (setq-local fill-column 120)
    (setq-local tab-width 4)
    (setq-local evil-shift-width 4)
    (setq-local indent-tabs-mode nil)

    (setq-local ffip-patterns '("*.sh"))))


(add-hook 'c-mode-hook
  (lambda ()
    (setq-local fill-column 120)
    (setq-local c-basic-offset 4)
    (setq-local tab-width 4)
    (setq-local evil-shift-width 4)
    (setq-local indent-tabs-mode nil)

    (setq-local ffip-patterns
      '("*.c" "*.cc" "*.cpp" "*.cxx" "*.h" "*.hh" "*.hpp" "*.hxx" "*.inl"))

    ;; Don't delimit on '_'. Why?
    ;; .. makes searching for variable names inconvenient.
    (modify-syntax-entry ?_ "w")))



;; ---------- KEYMAPS ----------
(global-set-key (kbd "C-=") 'default-font-presets-scale-increase)
(global-set-key (kbd "C--") 'default-font-presets-scale-decrease)
(global-set-key (kbd "C-0") 'default-font-presets-scale-reset)


(global-set-key (kbd "<C-mouse-4>") 'default-font-presets-scale-increase)
(global-set-key (kbd "<C-mouse-5>") 'default-font-presets-scale-decrease)

(define-key evil-insert-state-map (kbd "C-SPC") 'company-complete-common)


(with-eval-after-load 'evil
  (evil-set-leader '(normal) (kbd "<SPC>"))

  (evil-define-key 'normal 'global (kbd "<leader>fs") 'save-buffer)
  ;; Interactive file name search.
  (evil-define-key 'normal 'global (kbd "<leader>.") 'find-file-in-project)
  ;; Interactive file content search (git).
  (evil-define-key 'normal 'global (kbd "<leader>sp") 'counsel-git-grep)
  ;; Interactive current-file search.
  (evil-define-key 'normal 'global (kbd "<leader>ss") 'swiper)
  ;; Interactive open-buffer switch.
  (evil-define-key 'normal 'global (kbd "<leader>b") 'counsel-switch-buffer))


(setq custom-file (concat user-emacs-directory "custom.el"))
(load custom-file 'noerror)
