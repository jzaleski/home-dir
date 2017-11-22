(require 'package)

(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
(add-to-list 'package-archives '("melpa-stable" . "http://stable.melpa.org/packages/"))
(add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/"))

(add-to-list 'default-frame-alist '(background-color . "#2d2d2d"))

(package-initialize)

(load-theme 'dracula t)

(defalias 'yes-or-no-p 'y-or-n-p)

(menu-bar-mode -1)
(show-paren-mode 1)

(setq column-number-mode t)

(global-linum-mode t)
(setq linum-format "%3d ")
(set-face-background 'linum "#2d2d2d")
(set-face-foreground 'linum "#ffffff")

(global-git-gutter-mode +1)

(global-hl-line-mode +1)
(set-face-background 'hl-line "#1c1c1c")
(set-face-foreground 'highlight nil)

(setq auto-save-default nil)
(setq make-backup-files nil)

(ac-config-default)

(require 'evil)
(evil-mode t)

(require 'fill-column-indicator)
(setq fci-rule-character ?\u2502)
(setq fci-rule-column 80)
(define-globalized-minor-mode global-fci-mode fci-mode turn-on-fci-mode)
(global-fci-mode 1)

(projectile-mode)
(setq projectile-completion-system 'grizzl)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages(quote(auto-complete dracula-theme evil fill-column-indicator grizzl helm magit projectile)))
)

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
)
