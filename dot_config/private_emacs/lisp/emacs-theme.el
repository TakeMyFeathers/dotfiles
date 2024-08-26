;; -*- lexical-binding: t; -*-

(add-to-list 'default-frame-alist '(font . "IosevkaTermSlab Nerd Font Propo-15"))

(use-package catppuccin-theme :config (setq catppuccin-flavor 'mocha))

(use-package
 modus-themes
 :bind ("<f5>" . modus-themes-toggle)
 :config
 (setq modus-themes-disable-other-themes t)
 (setq modus-themes-mixed-fonts t)
 (setq modus-themes-italic-constructs t)
 (setq modus-themes-bold-constructs nil)
 (setq modus-themes-completions '((t . (extrabold))))
 (setq modus-themes-prompts '(extrabold))
 :init (load-theme 'modus-operandi :no-confirm))

(use-package
 spacious-padding
 :config
 (setq spacious-padding-widths
       '(:internal-border-width
         15
         :header-line-width 4
         :mode-line-width 6
         :tab-width 4
         :right-divider-width 30
         :scroll-bar-width 8
         :fringe-width 8))
 (setq spacious-padding-subtle-mode-line
       `(:mode-line-active
         'default
         :mode-line-inactive vertical-border))
 :init (spacious-padding-mode +1))

(use-package
 rainbow-delimiters
 :ensure t
 :hook (prog-mode . rainbow-delimiters-mode))

(provide 'emacs-theme)
