(use-package
 emacs
 :ensure nil
 :config
 (setq inhibit-startup-message t)
 (setq use-dialog-box nil)
 (setq initial-scratch-message nil)
 (setq tab-always-indent 'complete)
 (setq save-interprogram-paste-before-kill t)
 (setq apropos-do-all t)
 (setq mouse-yank-at-point t)
 (setq require-final-newline t)
 (setq load-prefer-newer t)
 (setq backup-by-copying t)
 (setq frame-inhibit-implied-resize t)
 (setq enable-recursive-minibuffers t)
 (setq ediff-window-setup-function 'ediff-setup-windows-plain)
 (set-fringe-mode 0)
 (auto-fill-mode 1)
 (electric-pair-mode 1)
 :bind
 (:map
  global-map
  ("M-o" . 'other-window)
  ("<f5>" . #'modus-themes-toggle)
  ("C-x k" . 'kill-this-buffer)))

(setq-default indent-tabs-mode t)

(use-package
 tooltip
 :ensure nil
 :hook (after-init . tooltip-mode)
 :config
 (setq
  tooltip-delay 0.5
  tooltip-short-delay 0.5
  x-gtk-use-system-tooltips t
  tooltip-frame-parameters
  '((name . "tooltip")
    (internal-border-width . 10)
    (border-width . 0)
    (no-special-glyphs . t))))

(use-package
 delsel
 :ensure nil
 :hook (after-init . delete-selection-mode))

(use-package
 recentf
 :ensure nil
 :hook (after-init . recentf-mode)
 :config
 (setq recentf-max-saved-items 25)
 (setq recentf-max-menu-items 25)
 (setq recentf-save-file-modes nil)
 (setq recentf-keep nil)
 (setq recentf-auto-cleanup t)
 (setq recentf-initialize-file-name-history nil)
 (setq recentf-filename-handlers nil)
 (setq recentf-show-file-shortcuts-flag nil))

(use-package
 autorevert
 :ensure nil
 :hook (after-init . global-auto-revert-mode)
 :config (setq auto-revert-verbose t))

(provide 'emacs-essentials)
