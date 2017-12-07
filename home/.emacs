(require 'package)

(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
(add-to-list 'package-archives '("melpa-stable" . "http://stable.melpa.org/packages/"))
(add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/"))

(setq-default indent-tabs-mode nil)

(add-to-list 'default-frame-alist '(background-color . "#2d2d2d"))

(package-initialize)

(defalias 'yes-or-no-p 'y-or-n-p)

(menu-bar-mode -1)
(show-paren-mode 1)
(tool-bar-mode -1)

;; GUI customizations
(if window-system
  (progn
    (scroll-bar-mode -1)
    (set-frame-font "PT Mono 14" nil t)
  )
)

(global-unset-key (kbd "C-z"))

(setq auto-save-default nil)
(setq column-number-mode t)
(setq make-backup-files nil)

(load-theme 'dracula t)

(global-linum-mode t)
(set-face-background 'linum "#2d2d2d")
(set-face-foreground 'linum "#ffffff")
(setq linum-format "%3d ")

(global-git-gutter-mode +1)

(global-hl-line-mode +1)
(set-face-background 'hl-line "#1c1c1c")
(set-face-foreground 'highlight nil)

(global-auto-complete-mode t)
(ac-config-default)

(evil-mode t)

(define-globalized-minor-mode global-fci-mode fci-mode turn-on-fci-mode)
(global-fci-mode 1)
(setq fci-rule-character ?\u2502)
(setq fci-rule-column 80)

(projectile-mode)
(setq projectile-completion-system 'grizzl)
(setq projectile-enable-caching nil)
(setq projectile-require-project-root nil)

(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
  '(package-selected-packages
    (quote
      (
        auto-complete
        dracula-theme
        evil
        fill-column-indicator
        git-gutter
        grizzl
        helm
        magit
        projectile
      )
    )
  )
)

(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
)
